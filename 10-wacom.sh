#!/bin/bash

case $1/$2 in
  pre/*)
    # echo "Going to $2..."
    /usr/bin/rmmod wacom
    ;;
  post/*)
    # echo "Waking up from $2..."
    /usr/bin/modprobe wacom
    ;;
esac

