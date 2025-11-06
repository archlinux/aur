
update:
	updpkgsums
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src liblad*y lady*

