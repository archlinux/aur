SHELL := /bin/bash
PKGNAME := $(shell awk -F= '/^pkgname=/ {print $$2}' PKGBUILD)
PKGVER := $(shell awk -F= '/^pkgver=/ {print $$2}' PKGBUILD)
PKGREL := $(shell awk -F= '/^pkgrel=/ {print $$2}' PKGBUILD)
PKGFILE := $(PKGNAME)-$(PKGVER)-$(PKGREL)-x86_64.pkg.tar.zst
PKGURL := https://github.com/Azure/azure-storage-fuse/archive/refs/tags/blobfuse-$(PKGVER).tar.gz

export LANG = C

#-------------------------------------------------------------------------------
# HELPERS
#-------------------------------------------------------------------------------

.PHONY: all
all: clean $(PKGFILE)

.PHONY: checksum
checksum:
	https -qd "$(PKGURL)" | sha256sum - | cut -d" " -f1

.PHONY: patch-prepare
patch-prepare: clean
	makepkg --nobuild
	mv src/$(PKGNAME)-blobfuse-$(PKGVER){,.orig}
	cp -r src/$(PKGNAME)-blobfuse-$(PKGVER).{orig,new}

.PHONY: patch-src
patch-src: patch-prepare

.PHONY: clean
clean:
	git clean -fdX

.PHONY: dist-clean
dist-clean: clean
	{ pacman -Qi boost >/dev/null 2>&1 && sudo pacman -Rnsu boost; } || true
	{ pacman -Qi cmake >/dev/null 2>&1 && sudo pacman -Rnsu cmake; } || true
	{ pacman -Qi gcc11 >/dev/null 2>&1 && sudo pacman -Rnsu gcc11; } || true

#-------------------------------------------------------------------------------
# FILES
#-------------------------------------------------------------------------------

$(PKGFILE):
	makepkg -s
	makepkg --printsrcinfo > .SRCINFO
