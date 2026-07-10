MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := push
.ONESHELL:

# Simple ANSI colours
CC_YELLOW=\033[0;33m
CC_WHITE=\033[1;37m
CC_END=\033[0m

# Ensure the requested version and release are set
pkgver ?= $(shell cat PKGBUILD | awk -F = '/^pkgver/ { print $$2 }')
pkgrel ?= $(shell cat PKGBUILD | awk -F = '/^pkgrel/ { print $$2 }')

ifeq ($(strip $(pkgver)),)
	$(error pkgver cannot be an empty string)
endif
ifeq ($(strip $(pkgrel)),)
	$(error pkgrel cannot be an empty string)
endif

# Get the current version information
current_pkgver=$(shell cat PKGBUILD | awk -F = '/^pkgver/ { print $$2 }')
current_pkgrel=$(shell cat PKGBUILD | awk -F = '/^pkgrel/ { print $$2 }')

ifeq ($(strip $(current_pkgver)),)
	$(error pkgver is not set in PKGBUILD)
endif
ifeq ($(strip $(current_pkgrel)),)
	$(error pkgrel is not set in PKGBUILD)
endif

ifneq ($(strip $(pkgver)),$(current_pkgver))
	ifeq ($(strip $(pkgrel)),$(current_pkgrel))
		ifneq ($(strip $(pkgrel)),1)
			$(error pkgrel must be specified when pkgver is changed and pkgrel is not 1)
		endif
	endif
endif

.PHONY: help
help: ## Show this help message
	@grep '.*:.*##' Makefile | grep -v grep | sort | sed 's/:.* ##/:/g' | column -t -s :

.PHONY: clean
clean: ## Clean the current workspace
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Cleaning up old package files${CC_END}"
	rm -rf *.pkg.tar.{xz,zst} *.{zip,gz,xz,zst}{,.part} *.deb
	echo -e "${CC_YELLOW}==>${CC_WHITE} Cleaning up old working directories${CC_END}"
	rm -rf ./pkg ./src

.PHONY: pull
pull: clean ## Pull changes from the AUR
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Check for, and pull, changes from AUR${CC_END}"
	git pull --ff-only

.PHONY: update-version
update-version: clean ## Update the package version in PKGBUILD (use pkgver and pkgrel)
	@if [ "$(pkgver)" = "$(current_pkgver)" ] && [ "$(pkgrel)" = "$(current_pkgrel)" ]; then
		echo -e "${CC_YELLOW}==>${CC_WHITE} No changes to the package version or release${CC_END}";
	else
		echo -e "${CC_YELLOW}==>${CC_WHITE} Update the package to $(pkgver)-$(pkgrel)"
		sed -i -e 's/^pkgver=.*$$/pkgver=$(pkgver)/' -e 's/^pkgrel=.*$$/pkgrel=$(pkgrel)/' PKGBUILD
	fi

.PHONY: update-pkgbuild
update-pkgbuild: update-version ## Update the checksums in the PKGBUILD
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Update the checksums in PKGBUILD${CC_END}"
	updpkgsums

.PHONY: build
build: update-pkgbuild ## Build the package (as a test)
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Building the $(pkgver)-$(pkgrel) package(s) as a test${CC_END}"
	makepkg -s

.PHONY: update-srcinfo
update-srcinfo: build ## Update the .SRCINFO file
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Update the .SRCINFO file${CC_END}"
	makepkg --printsrcinfo > .SRCINFO

.PHONY: commit
commit: update-pkgbuild update-srcinfo ## Commit the changes to the repository
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Commit the PKGBUILD and .SRCINFO files${CC_END}"
	git add PKGBUILD .SRCINFO
	git commit -m "Bump package to $(pkgver)-$(pkgrel)"

.PHONY: push
push: commit ## Push the changes back to up the AUR
	@echo -e "${CC_YELLOW}==>${CC_WHITE} Push the changes up to the AUR${CC_END}"
	git push
