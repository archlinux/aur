include prelude.mk

PKG_NAME := cmake-common

.PHONY: all
all: package

.PHONY: package
package:
	makepkg --clean --cleanbuild --force --syncdeps && makepkg --printsrcinfo > .SRCINFO

.PHONY: commit
commit:
	git add .SRCINFO
	source ./PKGBUILD && git commit -am "aur: $$pkgver-$$pkgrel"

.PHONY: push
push:
	git push 'ssh://aur@aur.archlinux.org/$(call escape,$(PKG_NAME)).git' "$$( git symbolic-ref HEAD ):master"
