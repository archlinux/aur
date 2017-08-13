
.SRCINFO: PKGBUILD
	mksrcinfo

package: PKGBUILD .SRCINFO
	updpkgsums
	makepkg --syncdeps --rmdeps --force --clean --noconfirm

all: package

clean:
	rm -Rv .SRCINFO *.bin *.tar.xz src/ pkg/ 2> /dev/null || true
