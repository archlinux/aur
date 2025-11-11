export SHELL = /usr/bin/env bash -xe
export PS4=\[\e[93m\]+MAKE+ \[\e[m\]

# override above values in your .local file.
# CHROOTPATH the value for
CHROOTPATH=/scratch/.chroot
#TODO: way to tell makepkg to use doas
-include Makefile.local

default: all
all: clean build
.PHONY: info
info:
	$(info lazy makepkg v1)
	$(info CHROOTPATH is "$(CHROOTPATH)")
	$(info )
.PHONY: help
help: info
	$(info )
	$(info clean: self explanatory)
	$(info build: default. lint and build in a new chroot)
.PHONY: clean
clean:
	-rm -f *.tgz *.tar.gz
	-rm -fr src/*

.PHONY: lint
lint: PKGBUILD
	namcap $<
	shellcheck --shell=bash --exclude=SC2034,SC2154,SC2164 $<

.PHONY: build
build: info lint
	extra-x86_64-build -r $(CHROOTPATH)


