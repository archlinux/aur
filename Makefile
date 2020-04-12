build: generate_install check update_checksums build_srcinfo

check:
	namcap PKGBUILD

update_checksums:
	updpkgsums

build_srcinfo:
	makepkg --printsrcinfo | tr -d "\t" > .SRCINFO

generate_install:
	bash generate_install.sh

publish: build
	git add Makefile PKGBUILD .SRCINFO .install
	git commit -m "$(MSG)"
	git push
