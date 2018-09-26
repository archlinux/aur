package: .SRCINFO
	makepkg

.SRCINFO:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg
	rm -rf src
	rm -rf thunderbolt-software-user-space
	rm thunderbolt-software-user-space-*-x86_64.pkg.tar.xz

.PHONY: .SRCINFO
