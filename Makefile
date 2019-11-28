package:
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	@test -d pkg && chmod -R u+w pkg
	@test -d src && chmod -R u+w src
	@rm -vrf pkg
	@rm -vrf src
	@rm -vr *.tar.gz
	@rm -vr *.tar.xz
