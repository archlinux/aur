
.PHONY: update

update: checksums srcinfo

checksums:
	updpkgsums

srcinfo:
	makepkg --printsrcinfo >.SRCINFO

build: update
	makepkg -cCf

install: update
	makepkg -icCf
