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
	$(info - $(COLOR_MESSAGE)"make test"$(COLOR_RESET)  to test the PKGBUILD file)
	$(info - $(COLOR_MESSAGE)"make build"$(COLOR_RESET) to build the PKGBUILD file just to see if it compiled fine)
	$(info - $(COLOR_MESSAGE)"make deps"$(COLOR_RESET)  to check if dependencies are installed)
	$(info - $(COLOR_MESSAGE)"make clean"$(COLOR_RESET) to clean the left-over files)
	$(info - $(COLOR_MESSAGE)"make patch"$(COLOR_RESET) to create a patch to be submitted as contribution)
	$(info - $(COLOR_MESSAGE)"make help"$(COLOR_RESET)  to show this help)
	$(info )
	$(info You can turn off colorizing the make output by $(COLOR_MESSAGE)"COLOR=FALSE"$(COLOR_RESET))
	$(info --------------------------------------------------------------------------------)
	$(info The order of use:)
	$(info  1. $(COLOR_MESSAGE)"make deps"$(COLOR_RESET))
	$(info  2. apply the changes you think necessary)
	$(info  3. $(COLOR_MESSAGE)"make build"$(COLOR_RESET))
	$(info  4. fix possible errors and repleat step 3 and 4 until there is no error)
	$(info  5. $(COLOR_MESSAGE)"make test"$(COLOR_RESET))
	$(info  6. fix possible errors and repleat step 5 and 6 until there is no error)
	$(info  7. $(COLOR_MESSAGE)"make patch"$(COLOR_RESET) to create the patch, and then submit it for maintainers)
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

build: clean
	namcap -i PKGBUILD && \
	makepkg --printsrcinfo > .SRCINFO && \
	makepkg

test: build
	sudo pacman -U flameshot-git-r*.zst

patch:
	git diff --oneline --graph > my.patch
