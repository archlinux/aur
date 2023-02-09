all: help

.SILENT: help
.PRECIOUS: .SRCINFO PKGBUILD
.PHONY: help build update install publish

REPODIR := $(shell grep -Em1 '^source=' PKGBUILD | cut -d= -f2 | sed -r "s/^\('(.*)'\)\$$/\1/ ; s~^git\+https?://github.com/.*/([^/]+)/?\$$~\1~")
REPO_BRANCH = $(shell git --bare --git-dir=$(REPODIR) branch --show-current | tr -d "\r\n")
PKGNAME = $(shell grep -Em1 '^pkgname=' PKGBUILD | cut -d= -f2)
PKGVER = $(shell grep -Em1 '^pkgver=' PKGBUILD | cut -d= -f2)
PKGREL = $(shell grep -Em1 '^pkgrel=' PKGBUILD | cut -d= -f2)
TARGET_ARCHIVE = $(PKGNAME)-$(PKGVER)-$(PKGREL)-any.pkg.tar.zst
AUR_GIT_REMOTE = $(shell git remote show -n | head -n1)
AUR_GIT_BRANCH = $(shell git branch --show-current)

ifneq ($(findstring /, $(REPODIR)), )
  $(error Unable to determine REPODIR from PKGBUILD; got invalid value: $(REPODIR))
endif

help:
	echo "usage: make [help|update|build|install|publish]"

publish: update
	git add .SRCINFO PKGBUILD
	git commit -m 'Updated .SRCINFO and PKGBUILD changes for updated version'
	git push $(AUR_GIT_REMOTE) $(AUR_GIT_BRANCH)

install: build
	makepkg --noextract --install --needed

update: build

build: .SRCINFO
	git --bare --git-dir=$(REPODIR) fetch origin "$(REPO_BRANCH)"

.SRCINFO: $(TARGET_ARCHIVE)
	makepkg --printsrcinfo > .SRCINFO

%.pkg.tar.zst: PKGBUILD $(REPODIR)/
	makepkg -f

$(REPODIR)/:
	makepkg -o
	[ -e $(REPODIR)/config -a -e $(REPODIR)/HEAD ]
