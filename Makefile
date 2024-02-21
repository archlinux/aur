# vim: ts=4 sw=4 noet

BUILD	= makepkg --log --syncdeps --rmdeps --check
NAME	= $(shell awk -F '=' '/^pkgname=/ {print $$2}' PKGBUILD)

define usage

Available make targets:

  build     Build $(NAME), but do not install.
  clean     Cleanup build artifacts and logs.
  help      Display this text.
  install   Build and install $(NAME).
  mrproper  Cleanup thoroughly, including downloaded files.
  remove    Print command to uninstall $(NAME) and its orphaned dependencies.
  schk      Check shell scripts.

endef

.PHONY:	build clean help mrproper remove schk

help:
	$(info $(usage))
	@exit 0

clean:
	rm -fr pkg src $(NAME)-*.{log,zst}*

mrproper:	clean
	rm -f pkg src $(NAME)-*.gz

.SRCINFO:	PKGBUILD
	makepkg --printsrcinfo >$@

build:	PKGBUILD
	$(BUILD)

install:	PKGBUILD
	$(BUILD) --install

remove:
	@echo -e "# Run the following only if you are certain:\nsudo pacman -Rs $(NAME)"

schk:
	shellcheck -s bash -e SC2034,SC2154 PKGBUILD
