# vim: ts=4 sw=4 noet

PKG		= $(shell awk -F '"' '/^pkgname/ {print $$2}' PKGBUILD)
BUILD	= makepkg --log --syncdeps --rmdeps --check

define usage

Available make targets:

  build     Build $(PKG) but do not install.
  clean     Cleanup build artifacts and logs.
  help      Display this text.
  install   Build and install $(PKG).
  janitor   Housekeeping jobs.
  mrproper  Cleanup thoroughly, including downloaded files.
  remove    Print command to uninstall $(PKG) and its orphaned dependencies.
  schk      Check shell scripts.

endef

.PHONY:	build clean help janitor mrproper remove schk

help:
	$(info $(usage))
	@exit 0

clean:
	rm -fr pkg src $(PKG)-*.{log,zst}*

mrproper:	clean
	rm -f pkg src $(PKG)-*.gz

build:	.SRCINFO
	$(BUILD)

install:
	$(BUILD) --install

remove:
	@echo -e "# Run the following only if you are certain:\nsudo pacman -Rs $(PKG)"

janitor:
	sort -o .gitignore .gitignore

schk:
	shellcheck -s bash -e SC2034 PKGBUILD *.sh

.SRCINFO:	PKGBUILD
	updpkgsums && makepkg --printsrcinfo >$@
