package: PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	makepkg --syncdeps --rmdeps --force --clean --noconfirm

all: package

clean:
	rm -fRv .SRCINFO *.tar.* socanui/ src/ pkg/ *.asc 2> /dev/null || true
