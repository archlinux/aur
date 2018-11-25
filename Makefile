# SHELL:=/bin/bash
.DEFAULT_GOAL:=update

export ROOTDIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
export VIRTUAL_ENV:=$(ROOTDIR)/venv
export PATH:=$(VIRTUAL_ENV)/bin:$(PATH)

## Install all dependencies
# Usage:
#  make deps
deps:
	@cd "$(ROOTDIR)"
	@if [ ! -d $(VIRTUAL_ENV)/bin ] ; \
	then \
		virtualenv --python=python3 "$(VIRTUAL_ENV)" ;\
	fi
	@. $(VIRTUAL_ENV)/bin/activate ; \
	$(VIRTUAL_ENV)/bin/pip3 install -r $(ROOTDIR)/requirements.txt -q


## Check for updates
## will update "new_ver.txt"

## Update (automatic)
update: deps
	nvchecker source.ini
	./update.sh wagoodman/dive
	makepkg --printsrcinfo  > .SRCINFO

clean:
	rm -rf src pkg *.tar.xz *.gz *.pkg.tar *.tar.gz
	rm -rf $(VIRTUAL_ENV)
