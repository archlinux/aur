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
	{ pacman -Qi boost >/dev/null 2>&1 && sudo pacman -Rnsu boost; } || true
	{ pacman -Qi cmake >/dev/null 2>&1 && sudo pacman -Rnsu cmake; } || true

#-------------------------------------------------------------------------------
# FILES
#-------------------------------------------------------------------------------

$(PKGFILE):
	makepkg -s
	makepkg --printsrcinfo > .SRCINFO
