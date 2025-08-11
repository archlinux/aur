
update:
	updpkgsums
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src air* Air* awcons*

