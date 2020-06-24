.PHONY: all clean verify force-build update-checksums

PACKAGE=akku-*-any.pkg.tar.xz

# default
all: $(PACKAGE)
	@make verify
	@make .SRCINFO

clean:
	-rm *.tar.*
	-rm -R src/
	-rm -R pkg/

# NOTE: excludes are only used to prevent namcap false positives over Guile object (.go) files
verify: PKGBUILD $(PACKAGE)
	@namcap PKGBUILD
	@namcap --exclude=anyelf,elfgnurelro,elfunstripped,elfnopie $(PACKAGE)

# forces a full makepkg build
force-build:
	@LC_ALL=C makepkg -f --clean

# downloads files, generates checksums and updates them on PKGBUILD
update-checksums:
	makepkg --verifysource --skipchecksums -f --nobuild --noextract
	updpkgsums

.SRCINFO: PKGBUILD
	@makepkg --printsrcinfo > .SRCINFO

$(PACKAGE): PKGBUILD
	@make force-build
