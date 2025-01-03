# vim: ts=4 sw=4 noet

BUILD	= makepkg --log --syncdeps --rmdeps --check
NAME	= $(shell awk -F '"' '/^pkgname=/ {print $$2}' PKGBUILD)

define usage

Available make targets:

  build     Build $(NAME), but do not install.
  clean     Cleanup build artifacts and logs.
  geninteg  Generate integrity checksums.
  help      Display this text.
  install   Build and install $(NAME).
  janitor   Housekeeping jobs.
  mrproper  Cleanup thoroughly, including downloaded files.
  remove    Print command to uninstall $(NAME) and its orphaned dependencies.

endef

.PHONY:	build clean geninteg help install janitor mrproper remove shc

help:
	$(info $(usage))
	@exit 0

clean:
	rm -fr pkg src $(NAME)-*.{log,zst}*

mrproper:	clean
	rm -f pkg src $(NAME)-*.gz

geninteg:
	sed '/^b2sums=/,/)$$/d' PKGBUILD >.tmp
	makepkg --geninteg | sed 's/^\s\+/\t/' >>.tmp
	mv .tmp PKGBUILD

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

shc:	PKGBUILD *.sh
	shcare $^ || shellcheck $^
