package:
	makepkg

srcinfo: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src *.tar.xz couchbase-sync-gateway-community_*_x86_64.deb
