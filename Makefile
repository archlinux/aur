.PHONY: all clean checksums

PACKAGE = akku-*-any.pkg.*

# default
all: $(PACKAGE)
	@make checksums
	@make .SRCINFO

clean:
	-rm *.tar.*
	-rm -R src/
	-rm -Rf pkg/

$(PACKAGE): PKGBUILD define-values.patch
	makepkg -f

# downloads files, generates checksums and updates them on PKGBUILD
checksums:
	makepkg --verifysource --skipchecksums -f --nobuild --noextract
	updpkgsums

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO
