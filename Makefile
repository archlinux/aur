all: | update-pkgsums update-srcinfo
.PHONY: all

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO
.PHONY: update-srcinfo

update-pkgsums:
	rm -f *.tar.gz{,part}
	updpkgsums
.PHONY: update-pkgsums

compare-versions:
	# https://github.com/erdii/toolbox/blob/main/cmd/aur-compare-oc-versions/main.go
	aur-compare-oc-versions
.PHONY: compare-versions
