#!/bin/bash
if [ $(pidof -x "Blizcord.sh"| wc -w) -gt 2 ]; then 
    echo "Another instance is already running"
    exit
fi

java -jar Blizcord.exe --disable-update-checker "$@"
