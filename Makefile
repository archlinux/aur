
.SRCINFO: PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

package: PKGBUILD .SRCINFO
	makepkg --syncdeps --rmdeps --force --clean --noconfirm

all: package

clean:
	rm -Rv .SRCINFO *.tar.gz *.tar.xz *.tar.zst src/ pkg/ 2> /dev/null || true
