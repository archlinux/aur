SHELL := /bin/bash
PKGNAME := $(shell awk -F= '/^pkgname=/ {print $$2}' PKGBUILD)
PKGVER := $(shell awk -F= '/^pkgver=/ {print $$2}' PKGBUILD)
PKGREL := $(shell awk -F= '/^pkgrel=/ {print $$2}' PKGBUILD)
PKGFILE := $(PKGNAME)-$(PKGVER)-$(PKGREL)-x86_64.pkg.tar.zst

#-------------------------------------------------------------------------------
# HELPERS
#-------------------------------------------------------------------------------

.PHONY: all
all: $(PKGFILE)

.PHONY: clean
clean:
	git clean -fdX
	sudo pacman -Rnsu boost cmake

#-------------------------------------------------------------------------------
# FILES
#-------------------------------------------------------------------------------

$(PKGFILE):
	makepkg -s
	makepkg --printsrcinfo > .SRCINFO
