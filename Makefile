
.SRCINFO: PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

package: PKGBUILD .SRCINFO
	makepkg --syncdeps --rmdeps --force --clean --noconfirm

all: package

clean:
	rm -Rv .SRCINFO *.jar *.deb *.exe *.tar.gz *.tar.xz *.tar.zst *.zip src/ pkg/ 2> /dev/null || true
