.PHONY: all clean repro


all: clean %-x86_64.pkg.tar.zst

clean:
	rm -rf *.tar.* *.log pkg/ src/

.SRCINFO:	PKGBUILD
	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO

%-x86_64.pkg.tar.zst: .SRCINFO
	@extra-x86_64-build

repro: %-x86_64.pkg.tar.zst
	@makerepropkg -d *.pkg.tar.zst

