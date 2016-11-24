update: clean wcwidthcallback.patch PKGBUILD .SRCINFO
	
PKGBUILD: wcwidthcallback.patch
	updpkgsums

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@

wcwidthcallback.patch:
	curl -s https://github.com/exg/rxvt-unicode/compare/master...blueyed:wcwidth-hack.diff > $@

clean:
	$(RM) -f wcwidthcallback.patch
