MAKEFLAGS += --no-builtin-rules --no-builtin-variables --warn-undefined-variables
unexport MAKEFLAGS
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c

escape = $(subst ','\'',$(1))

define noexpand
ifeq ($$(origin $(1)),environment)
    $(1) := $$(value $(1))
endif
ifeq ($$(origin $(1)),environment override)
    $(1) := $$(value $(1))
endif
ifeq ($$(origin $(1)),command line)
    override $(1) := $$(value $(1))
endif
endef

PKG_NAME := cmake-common

this_dir := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: all
all: package

.PHONY: package
package:
	makepkg --clean --cleanbuild --force --syncdeps && makepkg --printsrcinfo > '$(call escape,$(this_dir))/.SRCINFO'

.PHONY: commit
commit:
	source PKGBUILD && git commit -am "aur: $$pkgver-$$pkgrel"

.PHONY: push
push:
	git push 'ssh://aur@aur.archlinux.org/$(call escape,$(PKG_NAME)).git' "$$( git symbolic-ref HEAD ):master"

.PHONY: clean
clean:
	find '$(call escape,$(this_dir))' -type f '-(' -name '*.tar.gz' -o -name '*.tar.zst' '-)' -delete
