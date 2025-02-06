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

endef

.PHONY:	build check clean help install mrproper remove shc

help:
	$(info $(usage))
	@exit 0

clean:
	rm -fr pkg src $(NAME)-*.{log,zst}* logpipe*

mrproper:	clean
	rm -fr pkg src $(NAME)-*.gz

.SRCINFO:	PKGBUILD
	makepkg --printsrcinfo >$@

build:	PKGBUILD
	$(BUILD)

check:	PKGBUILD
	$(BUILD) --check

install:	PKGBUILD
	$(BUILD) --cleanbuild --install

remove:
	@echo -e "# Run the following only if you are certain:\nsudo pacman -Rs $(NAME)"

shc:	PKGBUILD *.install
	shcare $^ || shellcheck $^
