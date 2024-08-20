MAKEFLAGS += --warn-undefined-variables
SHELL=/bin/bash

REPO = $(shell grep url .SRCINFO | cut -d '=' -f 2 | tr -d '[:space:]')
VERSION = $(shell grep pkgver .SRCINFO | cut -d '=' -f 2 | tr -d '[:space:]')
TRASH = $(shell git check-ignore * | tr '\n' ' ')

# DEFAULT
all: clean sum build check pre clean

# just build the package
build:
	makepkg -sfr

# build and install the package
install:
	makepkg --install

# update checksums
sum:
	updpkgsums

# check/lint
check:
	@echo "shellcheck: "
	shellcheck -e SC2148 -e SC2034 PKGBUILD || exit 0

	@echo "shell formate: "
	shfmt -d PKGBUILD || exit 0

	@echo "checking PKGBUILD: "
	namcap -i PKGBUILD

	@echo "checking build: "
	namcap -i *.pkg.*

# clean up the mess
clean:
ifeq ($(strip $(TRASH)),)
	@echo "nothing to clear"
else
	file $(TRASH)
	@echo -n "Are you sure? [Y/n] " && read ans && if [ $${ans:-'Y'} = 'Y' ]; then \
        trash-put -v $(TRASH) ; \
        exit 0 ; \
    fi
endif

# prepare for commit
pre:
	shfmt -w PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

	git diff

	git add PKGBUILD
	git add changelog.md
	git add .SRCINFO
	git add .gitignore
	git add Makefile

# commit with version bump message
commit:
	$(eval VERSION := $(shell read -p "enter version (pkgver=$(VERSION)): " enter ; echo $${enter}))
	@echo "commit message: \"updating to v$(VERSION)\""

	@echo -n "Are you sure? [Y/n] " && read ans && if [ $${ans:-'Y'} = 'Y' ]; then \
        git diff --cached ; \
        exit 0 ; \
    fi

	@echo -n "Are you sure? [Y/n] " && read ans && if [ $${ans:-'Y'} = 'Y' ]; then \
        git commit -m "updating to v$(VERSION)" ; \
        exit 0 ; \
    fi

	@echo "recheck everything before pushing to AUR"
