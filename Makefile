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
  push      Push to all configured Git remotes.
  remove    Print command to uninstall $(NAME) and its orphaned dependencies.
  schk      Check shell scripts.

endef

.PHONY:	build clean help janitor mrproper push remove schk

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

janitor:	.gitignore .SRCINFO
	sort -o $< $<

push:
	for _r in $(shell git remote); do git push $$_r; done; unset _r

schk:
	shellcheck -s bash -e SC2034 PKGBUILD *.sh
