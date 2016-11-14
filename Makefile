include .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

SOURCE_ARCHIVE    = Flask-Principal-$(pkgver).tar.gz
SOURCE_DIRECTORY  = src
PACKAGE_DIRECTORY = pkg
PACKAGE_ARCHIVE   = $(pkgbase)-$(pkgver)-$(pkgrel)-$(arch).pkg.tar.xz

$(PACKAGE_ARCHIVE) $(PACKAGE_DIRECTORY) $(SOURCE_DIRECTORY) $(SOURCE_ARCHIVE): PKGBUILD
	makepkg -f

.PHONY: clean

clean:
	rm -rf $(SOURCE_ARCHIVE) $(SOURCE_DIRECTORY) $(PACKAGE_DIRECTORY) $(PACKAGE_ARCHIVE)
