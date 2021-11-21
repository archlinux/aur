package:
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	@test -d pkg && chmod -R u+w pkg
	@test -d src && chmod -R u+w src
	@rm -vrf pkg src *.tar.gz *.tar.xz *.tar.zst
