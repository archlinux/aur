# vi: set ft=make ts=2 sw=2 sts=0 noet:

SHELL := /bin/bash

MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

.PHONY: default
default: help

# http://postd.cc/auto-documented-makefile/
.PHONY: help help-common
help: help-common

help-common:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m %-30s\033[0m %s\n", $$1, $$2}'


.PHONY: install package clean test

install: ## install package
	makepkg -si

package: ## packaging for manual operation
	makepkg -s
	mksrcinfo

clean: ## remove tar.gz
	rm -vf *.tar.xz *.tar.gz

test: package ## test
	docker build -t arch:arch-package-test -f $(MAKEFILE_DIR)/Dockerfile $(MAKEFILE_DIR) && \
	docker run -it --rm -v $(MAKEFILE_DIR):/work -w /work arch:arch-package-test ./test.sh
	
