include prelude.mk

PKG_NAME := linux-status

.PHONY: all
all: build

.PHONY: build
build:
	makepkg --clean --cleanbuild --force --syncdeps && makepkg --printsrcinfo > .SRCINFO

.PHONY: commit
commit:
	git add .SRCINFO
	source ./PKGBUILD && git commit -am "aur: $$pkgver-$$pkgrel"

.PHONY: push
push:
	git push 'ssh://aur@aur.archlinux.org/$(call escape,$(PKG_NAME)).git' "$$( git symbolic-ref HEAD ):master"

.PHONY: pkgver
pkgver:
	@git fetch && \
	new_pkgver="$$( git describe --tags --abbrev=0 origin/master | sed 's/^v//' )" && \
	source PKGBUILD && \
	echo "Current pkgver: $$pkgver" && \
	echo "New pkgver: $$new_pkgver" && \
	if [ "$$pkgver" != "$$new_pkgver" ]; then \
		sed -i -e "s/^pkgver=.*/pkgver=$$new_pkgver/" PKGBUILD && \
		sed -i -e "s/^pkgrel=.*/pkgrel=1/" PKGBUILD ; \
	fi

.PHONY: maintenance
maintenance: pkgver
	$(MAKE) build

	@git_status="$$( git status --porcelain=v1 )" && \
	if [ -z "$$git_status" ]; then \
		true; \
	elif [ "$$git_status" = $$' M .SRCINFO\n M PKGBUILD' ]; then \
		$(MAKE) commit && \
		git push -q && \
		$(MAKE) push ; \
	else \
		echo; \
		echo '-----------------------------------------------------------------'; \
		echo 'Error: unrecognized modifications in the repository:'; \
		echo "$$git_status"; \
		echo '-----------------------------------------------------------------'; \
		exit 1; \
	fi
