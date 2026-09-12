# Update workflow (3 steps, run in order):
# * `pkgrel=y pkgver=x.x.x make update-sources`              # pull, bump version, refresh checksums, regenerate .SRCINFO
# * `make test-install-and-remove`                          # build, install, smoke-test, remove
# * `make commit-push-clean`                                # commit, push to the AUR, clean the workspace

MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := help
.ONESHELL:

# Simple ANSI colours
CC_YELLOW=\033[0;33m
CC_WHITE=\033[1;37m
CC_END=\033[0m

# Optional CLI overrides (pkgname=x pkgver=x pkgrel=x binaryname=x make ...)
pkgname ?=
pkgver ?=
pkgrel ?=
binaryname ?=

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

.PHONY: install
install: ## Build and install the package
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Install the package${CC_END}"
	makepkg -si

.PHONY: remove
remove: ## Remove the installed package
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Removing the package${CC_END}"
	sudo pacman -R $(use_pkgname)

.PHONY: test-install-and-remove
test-install-and-remove: install ## Install, test the binary, then remove the package
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Using the binary ${CC_END}"
	${use_binaryname} --version
	${use_binaryname} --help
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Removing the package${CC_END}"
	sudo pacman -R $(use_pkgname)

.PHONY: update-srcinfo
update-srcinfo: ## Update the .SRCINFO file from the current PKGBUILD
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Update the .SRCINFO file${CC_END}"
	makepkg --printsrcinfo > .SRCINFO

.PHONY: update-sources
update-sources: update-pkgbuild update-srcinfo ## Update PKGBUILD (pull/version/checksums) and regenerate .SRCINFO

.PHONY: commit
commit: ## Commit the current PKGBUILD/.SRCINFO to the repository
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
push: ## Push the current commits up to the AUR
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Push the changes up to the AUR${CC_END}"
	git push

.PHONY: commit-push-clean
commit-push-clean: commit push clean ## Commit, push to the AUR, and clean the workspace
