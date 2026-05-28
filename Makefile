# SPDX-FileCopyrightText: 2026 Florent Jardin <florent.jardin@dalibo.com>
#
# SPDX-License-Identifier: 0BSD

.PHONY: build clean install

VERSION=$(shell grep -m 1 pkgver PKGBUILD | cut -d= -f2)
ARCHPKG=pg-migrate-bin-$(VERSION)-1-x86_64.pkg.tar.zst

$(ARCHPKG): PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	makepkg -Cf

build: $(ARCHPKG)

clean:
	rm -rf $(shell cat .gitignore)

install: $(ARCHPKG)
	sudo pacman -U $(ARCHPKG)
