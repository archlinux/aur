#!/usr/bin/env -S make -s -f

# To debug the issues, start with checking if you have mistakenly used spaces
# instead of tabs (It shows the presence of tabs with `^I` and line endings
# with `$`):
#  cat -e -t -v Makefile
# Source: https://stackoverflow.com/a/16945143/1613005


SHELL = /bin/sh

# define a variable to store the dependencies
REQUIRED_BINS := sh bash namcap makepkg pacman git cmake

# define a newline character to be used in messages
define LINEBREAK


endef


COLOR ?= TRUE

ifeq ($(COLOR),TRUE)
	COLOR_RESET :=$(shell tput sgr0)
	COLOR_ERROR :=$(shell tput setaf 1)
	COLOR_SUCCESS :=$(shell tput setaf 2)
	COLOR_MESSAGE :=$(shell tput setaf 3)
else
	COLOR_RESET :=
	COLOR_ERROR :=
	COLOR_SUCCESS :=
	COLOR_MESSAGE :=
endif


.PHONY: all help deps clean test patch

all help:
	$(info --------------------------------------------------------------------------------)
	$(info Available arguments:)
	$(info - "make test"  to test the PKGBUILD file)
	$(info - "make deps"  to check if dependencies are installed)
	$(info - "make clean" to clean the left-over files)
	$(info - "make patch" to create a patch to be submitted as contribution)
	$(info - "make help"  to show this help)
	$(info )
	$(info You can turn off colorizing the make output by $(COLOR_MESSAGE)"COLOR=FALSE"$(COLOR_RESET))
	$(info --------------------------------------------------------------------------------)
	@:

deps: 
#	checking if the dependencies are me# checking if the dependencies are mett
	$(foreach bin,$(REQUIRED_BINS),\
		$(if $(shell command -v $(bin) 2> /dev/null),$(info $(COLOR_SUCCESS)[Ok]$(COLOR_RESET) Found `$(bin)`),$(error ${LINEBREAK}[Error] Missing Dependency. Please install `$(bin)`)))
	@:

clean:
	@declare -a REMOVABLE_PATTERN=('my.patch' 'flameshot-git-r*.zst') && \
	for F in "$${REMOVABLE_PATTERN[@]}"; do  \
		find ./ -maxdepth 1 -name $${F} -exec rm --interactive '{}' \; ; \
	done

test: clean
	namcap -i PKGBUILD
	makepkg
	sudo pacman -U flameshot-git-r*.zst

patch:
	git diff --oneline --graph > my.patch

