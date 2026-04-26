# vim: ts=4 sw=4 noet

BUILD	= @makepkg --log --syncdeps --rmdeps --check
BFAIL	= echo >&2 Did you install AUR package "python-flask-sqlalchemy-lite" first?
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
  verify    Verify file checksums.

endef

.PHONY:	build clean help install janitor mrproper pc remove verify

help:
	$(info $(usage))
	@exit 0

clean:
	rm -fr logpipe* pkg src $(NAME)-*.{log,zst}*

mrproper:	clean
	rm -f $(NAME)-*.gz

.SRCINFO:	PKGBUILD
	makepkg --printsrcinfo >$@

verify:
	@makepkg --verifysource || echo Remember to run '"updpkgsums"' if you changed or downloaded any files. >&2

pc:
	updpkgsums
	shcare PKGBUILD
	make .SRCINFO

build:	PKGBUILD
	$(BUILD) || $(BFAIL)

install:	PKGBUILD
	$(BUILD) --install || $(BFAIL)

remove:
	@echo -e "# Run the following only if you are certain:\nsudo pacman -Rs $(NAME)"

janitor:	.gitignore .SRCINFO
	sort -o $< $<
