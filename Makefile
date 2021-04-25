.PHONY: clean package

all: package

clean:
	rm PKGBUILD

package: PKGBUILD .SRCINFO
	makepkg

.SRCINFO: PKGBUILD
	mksrcinfo

PKGBUILD: PKGBUILD.template
	makepkg-template --template-dir . -p $< -o $@
