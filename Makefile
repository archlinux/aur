
.SRCINFO: PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

package: .SRCINFO
	makepkg --syncdeps --rmdeps --force --clean --noconfirm

all: package

clean:
	rm -fRv .SRCINFO *.tar.* spicedb/ src/ pkg/ *.asc 2> /dev/null || true
