.PHONY: all check release

all:
	makepkg -sd

check:
	namcap PKGBUILD

patch:
	git -C src/google-cloud-ops-agent-git diff > 0001-apps-hostmetrics.patch && \
	makepkg -g

release:
	makepkg --printsrcinfo > .SRCINFO
