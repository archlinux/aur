
.PHONY: build install update checksums srcinfo


build: update
	makepkg -cCf

install: update
	makepkg -icCf

update: checksums srcinfo

checksums:
	updpkgsums

srcinfo:
	makepkg --printsrcinfo >.SRCINFO

