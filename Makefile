include prelude.mk

PKG_NAME := linux-status

.PHONY: all
all: build

.PHONY: build
build:
	@echo '======================================================= Build ==='
	makepkg --clean --cleanbuild --force --noconfirm --noprogressbar --syncdeps
	makepkg --printsrcinfo > .SRCINFO
	@echo '================================================================='

.PHONY: commit
commit:
	@echo '====================================================== Commit ==='
	git add .SRCINFO
	source ./PKGBUILD && git commit -m "aur: $$pkgver-$$pkgrel"
	@echo '================================================================='

.PHONY: push
push:
	@echo '================================================= Push to AUR ==='
	git push 'ssh://aur@aur.archlinux.org/$(call escape,$(PKG_NAME)).git' "$$( git symbolic-ref HEAD ):master"
	@echo '============================================ Push to upstream ==='
	git push
	@echo '================================================================='

.PHONY: pkgver
pkgver:
	@git fetch && \
	new_pkgver="$$( git describe --tags --abbrev=0 origin/master | sed 's/^v//' )" && \
	source PKGBUILD && \
	echo '================================================ Check pkgver ===' && \
	echo "Current pkgver: $$pkgver" && \
	echo "New pkgver: $$new_pkgver" && \
	echo '=================================================================' && \
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
		$(MAKE) push ; \
	else \
		echo; \
		echo '-----------------------------------------------------------------'; \
		echo 'Error: unrecognized modifications in the repository:'; \
		echo "$$git_status"; \
		echo '-----------------------------------------------------------------'; \
		exit 1; \
	fi
