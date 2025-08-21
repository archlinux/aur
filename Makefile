# Update commands
# * `pkgrel=y pkgver=x.x.x make test-install-and-remove`
# * `pkgrel=y pkgver=x.x.x make update-srcinfo`
# * `pkgrel=y pkgver=x.x.x make push`
# * `pkgrel=y pkgver=x.x.x make clean`

MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := push
.ONESHELL:

# Simple ANSI colours
CC_YELLOW=\033[0;33m
CC_WHITE=\033[1;37m
CC_END=\033[0m

# Get the version information
current_pkgname=$(shell cat PKGBUILD | awk -F = '/^pkgname/ { print $$2 }')
use_pkgname=$(current_pkgname)
current_binaryname=$(shell cat PKGBUILD | awk -F = '/^_binaryname/ { print $$2 }')
use_binaryname=$(current_binaryname)
current_pkgver=$(shell cat PKGBUILD | awk -F = '/^pkgver/ { print $$2 }')
use_pkgver=$(current_pkgver)
current_pkgrel=$(shell cat PKGBUILD | awk -F = '/^pkgrel/ { print $$2 }')
use_pkgrel=$(current_pkgrel)

ifneq ($(strip $(pkgname)),)
	use_pkgname=$(pkgname)
endif
ifneq ($(strip $(pkgver)),)
	use_pkgver=$(pkgver)
endif
ifneq ($(strip $(pkgrel)),)
	use_pkgrel=$(pkgrel)
endif
ifneq ($(strip $(binaryname)),)
	use_binaryname=$(binaryname)
endif

.PHONY: help
help: ## Show this help message
	@grep '.*:.*##' Makefile | grep -v grep | sort | sed 's/:.* ##/:/g' | column -t -s :

.PHONY: clean
clean: ## Clean the current workspace
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Cleaning up old package files${CC_END}"
	rm -rf *.pkg.tar.{xz,zst} *.zip *.deb ${use_pkgname}-*
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Cleaning up old working directories${CC_END}"
	rm -rf ./pkg ./src

.PHONY: pull
pull: clean ## Pull changes from the AUR
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Check for, and pull, changes from AUR${CC_END}"
	git pull --ff-only

.PHONY: update-version
update-version: pull ## Update the package version in PKGBUILD (use pkgver and pkgrel)
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Update the package to $(use_pkgver)-$(use_pkgrel)"
	sed -i -e 's/^pkgver=.*$$/pkgver=$(use_pkgver)/' -e 's/^pkgrel=.*$$/pkgrel=$(use_pkgrel)/' PKGBUILD

.PHONY: update-pkgbuild
update-pkgbuild: update-version ## Update the checksums in the PKGBUILD
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Update the checksums in PKGBUILD${CC_END}"
	updpkgsums

.PHONY: build
build: update-pkgbuild ## Build the package (as a test)
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Build the package${CC_END}"
	makepkg -s

.PHONY: install
install: update-pkgbuild ## Install the package (as a test)
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Install the package${CC_END}"
	makepkg -si

.PHONY: test-install-and-remove
test-install-and-remove: install ## Using the package (as a test)
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Using the binary ${CC_END}"
	${use_binaryname} --version
	${use_binaryname} --help
	sudo pacman -R grafana-alloy-bin

.PHONY: update-srcinfo
update-srcinfo: build ## Update the .SRCINFO file
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Update the .SRCINFO file${CC_END}"
	makepkg --printsrcinfo > .SRCINFO

.PHONY: commit
commit: update-pkgbuild update-srcinfo ## Commit the changes to the repository
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Commit the PKGBUILD and .SRCINFO files${CC_END}"
	git add PKGBUILD .SRCINFO Makefile alloy-sysusers.conf alloy-tmpfiles.conf
	git commit -m "Bump package to $$(
		cat .SRCINFO \
			| awk -F ' = ' \
					' /\s+pkgver/ { version=$$2 }
					  /\s+pkgrel/ { release=$$2 }
						END 				{ printf "%s-%s", version, release }'
	)"

.PHONY: push
push: commit ## Push the changes back to up the AUR
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Push the changes up to the AUR${CC_END}"
	git push
