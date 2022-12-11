
.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

package: PKGBUILD .SRCINFO
	updpkgsums
	makepkg --syncdeps --rmdeps --force --clean --noconfirm

all: package

clean:
	rm -Rv .SRCINFO *.tar.* src/ pkg/ 2> /dev/null || true
