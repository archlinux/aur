update:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

test:
	makepkg -s

.PHONY: update test
