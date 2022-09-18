#!/bin/bash

if [ -z "$1" ]; then
	/usr/bin/flax
elif [ $1 == "-new" ]; then
	which zenity
	[ $? -ne 0 ] && exit 1
	_PROJNAME=$(zenity --entry --title="Flax project name" --text="Enter project name:" --entry-text "NewProject")
	[ $? -ne 0 ] && exit 1
	_PROJPATH=$(zenity  --file-selection --title="Choose a directory" --directory)
	[ $? -ne 0 ] && exit 1
	mkdir $_PROJPATH/$_PROJNAME
	[ $? -ne 0 ] && zenity --warning --text="Project cannot be created, check folder permissions" && exit 1
	cd $_PROJPATH/$_PROJNAME
	/usr/bin/flax -new
else
	/usr/bin/flax -project $1
fi
