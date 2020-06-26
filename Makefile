.PHONY: get-checksum
get-checksum:
	updpkgsums

.PHONY: update
update: get-checksum
	makepkg --printsrcinfo > .SRCINFO
