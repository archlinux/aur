.PHONY: all build push clean

all: .SRCINFO
	git add PKGBUILD .SRCINFO
	
.SRCINFO: PKGBUILD
	namcap PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

build:
	makepkg -f
	namcap *.pkg.tar.zst

push: build .SRCINFO
	git add PKGBUILD .SRCINFO
	git commit
	git push

clean:
	rm -f *.pkg.tar.zst
	rm -fr pkg src
