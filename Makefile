# vi: set ft=make ts=2 sw=2 sts=0 noet:

SHELL := /bin/bash

MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

TARGET_REPO := "fujiwara/ecsta"

.PHONY: default
default: help

# http://postd.cc/auto-documented-makefile/
.PHONY: help help-common
help: help-common

help-common:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m %-30s\033[0m %s\n", $$1, $$2}'


.PHONY: renew install update package clean update_tag test
renew: update_tag install ## get newer version and renew package, install that

install: ## install package
	makepkg -si

update_checksum: ## upgrade pkg checksum
	@# makepkg -g は更新してくれるわけではない
	@# https://wiki.archlinux.org/title/PKGBUILD#Integrity
	updpkgsums

package: update_checksum ## packaging for manual operation
	makepkg -s
	mksrcinfo

package_auto: update_tag ## Auto packaging 
	makepkg -s
	mksrcinfo

clean: ## remove tar.gz
	rm -vf *.tar.xz *.tar.gz

update_tag: LATEST := $(shell curl -sL https://api.github.com/repos/$(TARGET_REPO)/releases/latest | jq -r '.tag_name|ltrimstr("v")')
update_tag: ## get and update newest version in PKGBUILD
	source ./PKGBUILD && \
	if [[ $${pkgver} != $(LATEST) ]]; then \
	  sed -i -e 's/^pkgver=.*$$/pkgver=$(LATEST)/' ./PKGBUILD && \
		sed -i -e 's/^pkgrel=.*$$/pkgrel=1/' ./PKGBUILD && \
	  updpkgsums && \
	  git diff ./PKGBUILD;  \
	fi

test: ## test (needs make package)
	docker build -t arch:arch-package-test -f $(MAKEFILE_DIR)/Dockerfile $(MAKEFILE_DIR) && \
	docker run -it --rm -v $(MAKEFILE_DIR):/work -w /work arch:arch-package-test ./test.sh
	
