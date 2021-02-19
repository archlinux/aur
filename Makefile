.PHONY: update-srcinfo
update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

.PHONE: compare-versions
compare-versions:
	# https://github.com/erdii/toolbox/blob/main/cmd/aur-compare-oc-versions/main.go
	aur-compare-oc-versions
