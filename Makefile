SHELL := /bin/bash
PKGNAME := $(shell awk -F= '/^pkgname=/ {print $$2}' PKGBUILD)
_PKGNAME := $(shell awk -F= '/^_pkgname=/ {print $$2}' PKGBUILD)
PKGVER := $(shell awk -F= '/^pkgver=/ {print $$2}' PKGBUILD)
PKGREL := $(shell awk -F= '/^pkgrel=/ {print $$2}' PKGBUILD)
PKGFILE := $(PKGNAME)-$(PKGVER)-$(PKGREL)-any.pkg.tar.zst
PKGURL := https://github.com/elasticdog/$(_PKGNAME)/archive/refs/tags/v$(PKGVER).tar.gz

export LANG = C

#-------------------------------------------------------------------------------
# HELPERS
#-------------------------------------------------------------------------------

.PHONY: all
all: clean $(PKGFILE)

.PHONY: checksum
checksum:
	@https -qd "$(PKGURL)" | sha256sum - | cut -d" " -f1

.PHONY: clean
clean:
	git clean -fdX

.PHONY: dist-clean
dist-clean: clean

#-------------------------------------------------------------------------------
# FILES
#-------------------------------------------------------------------------------

$(PKGFILE):
	makepkg -s
	makepkg --printsrcinfo > .SRCINFO
