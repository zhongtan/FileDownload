# Zheng Hong Tan
# 29th July 2018
#
# This shell script asks the user for a HTTP/HTTPS url and then downloads all
# the PDF files contained within it to the specified directory. 

#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Usage: ./downloadFiles.sh [URL] [DEST]" 
  exit 1
fi

# attempt to download all the PDF files from the URL
url="$1"
destFolder="$2"
if [ ! -d "$destFolder" ]; then
  echo "given folder does not exist"
  exit 1
fi

# get all pdf files recursively up to one level deep while not creating a directory
# structure upon downloading and then storing them in the destination directory
# specified in the second user argument. 
r=`wget -r -l 1 -nd -A pdf "$1" -P "$2"`

if [ $? -ne 0 ]; then
  echo "Could not connect to the provided URL: wget failed"
  exit 1
fi

