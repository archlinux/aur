# vim: ts=4 sw=4 noet

BUILD	= makepkg --log --syncdeps --rmdeps --check
NAME	= $(shell awk -F '"' '/^pkgname=/ {print $$2}' PKGBUILD)

define usage

Available make targets:

  build     Build $(NAME), but do not install.
  clean     Cleanup build artifacts and logs.
  help      Display this text.
  install   Build and install $(NAME).
  janitor   Housekeeping jobs.
  mrproper  Cleanup thoroughly, including downloaded files.
  pc        Prepare AUR commit.
  remove    Print command to uninstall $(NAME) and its orphaned dependencies.

endef

.PHONY:	clean help install janitor mrproper pc remove shc

help:
	$(info $(usage))
	@exit 0

clean:
	rm -fr logpipe* pkg src $(NAME)-*.{log,zst}*

mrproper:	clean
	rm -f $(NAME)-*.gz

.SRCINFO:	PKGBUILD
	makepkg --printsrcinfo >$@

pc:
	updpkgsums
	shcare PKGBUILD
	make .SRCINFO

install:	PKGBUILD
	$(BUILD) --install

remove:
	@echo -e "# Run the following only if you are certain:\nsudo pacman -Rs $(NAME)"

janitor:	.gitignore .SRCINFO
	sort -o $< $<

shc:	PKGBUILD *.sh
	shcare $^ || shellcheck $^
