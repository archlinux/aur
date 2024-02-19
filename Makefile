# vim: ts=4 sw=4 noet

PKG = $(shell awk -F = '/^pkgname/ {print $$2}' PKGBUILD)

define usage

Available make targets:

  build    Build $(PKG) but do not install
  check    Check shell scripts
  clean    Cleanup build artifacts
  help     Display this text
  install  Build and install $(PKG)
  janitor  Housekeeping
  remove   Print command to uninstall $(PKG) and its orphaned dependencies

endef

.PHONY:	build check clean help janitor remove

help:
	$(info $(usage))
	@exit 0

clean:
	rm -fr pkg src $(PKG)-*{log,gz,zst}*

build:	.SRCINFO
	makepkg --force --log --syncdeps --rmdeps

install:	.SRCINFO
	makepkg --force --log --syncdeps --rmdeps --install

remove:
	@echo -e "# Run the following only if you are certain:\nsudo pacman -Rs $(PKG)"

janitor:
	sort -o .gitignore .gitignore

check:
	shellcheck -s bash -e SC2034 PKGBUILD *.sh

.SRCINFO:	PKGBUILD
	updpkgsums && makepkg --printsrcinfo >$@
