clean:
	rm -rI *.jar *.tar.zst pkg src

prepare:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
