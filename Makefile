.PHONY: clean package

all: package

clean:
	rm PKGBUILD

package: PKGBUILD
	makepkg
	mksrcinfo

PKGBUILD: PKGBUILD.template *.template
	makepkg-template --template-dir . -p $< -o $@
