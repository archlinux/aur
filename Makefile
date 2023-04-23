
.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

package: PKGBUILD .SRCINFO
	updpkgsums
	makepkg --syncdeps --rmdeps --force --clean --noconfirm

all: package

clean:
	rm -fRv .SRCINFO *.tar.* ktlint-*/ src/ pkg/ *.asc 2> /dev/null || true
