MAKEFLAGS += --warn-undefined-variables
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:
SHELL := bash
.SHELLFLAGS := -e -o pipefail -c

escape = $(subst ','\'',$(1))

PKG_NAME := linux-status

this_dir := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: all
all: package

.PHONY: package
package:
	makepkg --clean --cleanbuild --force --syncdeps && makepkg --printsrcinfo > '$(call escape,$(this_dir))/.SRCINFO'

.PHONY: tag
tag:
	source PKGBUILD && git tag "aur/v$$pkgver-$$pkgrel"

.PHONY: push
push:
	git push ssh://aur@aur.archlinux.org/linux-status.git "$$( git symbolic-ref HEAD ):master"

.PHONY: clean
clean:
	find '$(call escape,$(this_dir))' -type f '-(' -name '*.tar.gz' -o -name '*.tar.zst' '-)' -delete
