build: check update_checksums build_srcinfo

check:
	namcap PKGBUILD

update_checksums:
	updpkgsums

build_srcinfo:
	makepkg --printsrcinfo | tr -d "\t" > .SRCINFO

publish: build
	git add Makefile PKGBUILD .SRCINFO
	git commit -m "$(MSG)"
	git push
