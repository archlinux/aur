# Build a new release.

.PHONY: all archive clean

all: clean
	@./new_release.py $(pkgver) $(pkgrel)

	@echo
	@echo Running updpkgsums
	@updpkgsums

	@echo
	@echo Running "makepkg --printsrcinfo > .SRCINFO"
	@makepkg --printsrcinfo > .SRCINFO

archive:
	@echo
	@echo Building the archive
	@makepkg -f

clean:
	@rm -rf python-alpm-conf* pkg src
