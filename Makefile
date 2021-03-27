update:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
.PHONY: update

install:
	makepkg -si
.PHONY: update

compare-versions:
	# https://github.com/erdii/toolbox/blob/main/cmd/aur-compare-oc-versions/main.go
	aur-compare-oc-versions
.PHONY: compare-versions
