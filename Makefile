.PHONY: all clean
all:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf *.tar.* *.gz src pkg
