SHELL := /bin/bash
PKGNAME := $(shell awk -F= '/^pkgname=/ {print $$2}' PKGBUILD)
PKGVER := $(shell awk -F= '/^pkgver=/ {print $$2}' PKGBUILD)
PKGREL := $(shell awk -F= '/^pkgrel=/ {print $$2}' PKGBUILD)
PKGFILE := $(PKGNAME)-$(PKGVER)-$(PKGREL)-x86_64.pkg.tar.zst
PKGURL := https://github.com/Azure/azure-storage-fuse/archive/refs/tags/blobfuse2-$(PKGVER).tar.gz

export LANG = C

#-------------------------------------------------------------------------------
# HELPERS
#-------------------------------------------------------------------------------

.PHONY: all
all: clean $(PKGFILE)

.PHONY: checksum
checksum:
	https -qd "$(PKGURL)" | sha256sum - | cut -d" " -f1

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
