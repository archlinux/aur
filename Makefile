# SHELL:=/bin/bash
.DEFAULT_GOAL:=update

export ROOTDIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# ## Install all dependencies
# # Usage:
# #  make deps
# deps: deps-python

# #/ activates virenv and installs deps
# deps-python:
# 	@cd "$(ROOTDIR)"
# 	@if [ ! -d $(VIRTUAL_ENV)/bin ] ; \
# 	then \
# 		virtualenv --python=python3 "$(VIRTUAL_ENV)" ;\
# 	fi
# 	@. $(VIRTUAL_ENV)/bin/activate ; \
# 	$(VIRTUAL_ENV)/bin/pip3 install -r $(ROOTDIR)/requirements.txt -q

## Update (automatic)
update:
	nvchecker source.ini
	./update.sh

clean:
	rm -rf src pkg *.tar.xz *.gz *.pkg.tar
	rm -rf $(VIRTUAL_ENV)
