include prelude.mk

PKG_NAME := linux-status

.PHONY: all
all: build

.PHONY: build
build:
	makepkg --clean --cleanbuild --force --syncdeps && makepkg --printsrcinfo > .SRCINFO

.PHONY: commit
commit:
	source ./PKGBUILD && git commit -am "aur: $$pkgver-$$pkgrel"

.PHONY: push
push:
	git push 'ssh://aur@aur.archlinux.org/$(call escape,$(PKG_NAME)).git' "$$( git symbolic-ref HEAD ):master"
