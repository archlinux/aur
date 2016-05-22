
.SRCINFO: PKGBUILD
	mksrcinfo

package: PKGBUILD .SRCINFO
	updpkgsums
	makepkg --force --clean

all: package

clean:
	rm -Rv *.jpg .SRCINFO *.tar.gz *.tar.xz *.part src/ pkg/ 2> /dev/null || true
