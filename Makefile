.ONESHELL:
SHELL=bash
SHELOPTS=-euo pipefail
.PHONY: check-upstream update-checksums build test shell

.buildenvid: build-dev.Dockerfile
	docker build \
	  --pull \
	  --network=host \
	  -f build-dev.Dockerfile \
	  -t archlinux-build-dev \
	  --build-arg USERID=$$(id -u) \
	  --build-arg GROUPID=$$(id -g) \
	  --iidfile .buildenvid \
	  .

BUILDENV=docker run $(BUILDENVOPTS) --rm -v $(PWD):/build -i $$(cat .buildenvid)

check-upstream: BUILDENVOPTS:=-t
check-upstream: .buildenvid
	-$(BUILDENV) pkgctl version check

update-to-upstream: BUILDENVOPTS:=-t
update-to-upstream: .buildenvid
	-$(BUILDENV) pkgctl version upgrade
	$(MAKE) .SRCINFO


update-checksums: PKGBUILD .buildenvid
	$(BUILDENV) <<EOF
	makepkg --noconfirm -s -e -o -C -c
	updpkgsums
	EOF

.SRCINFO: PKGBUILD .buildenvid
	$(BUILDENV) <<EOF
	makepkg --printsrcinfo > .SRCINFO
	EOF

build: PKGBUILD .buildenvid
	$(BUILDENV) <<EOF
	namcap PKGBUILD
	makepkg --noconfirm -C -s -f
	makepkg --packagelist | xargs namcap
	EOF

test: .buildenvid build
	$(BUILDENV) <<EOF
	makepkg --noconfirm -i
	exfetch
	EOF

shell: .buildenvid
	docker run --rm -v $(PWD):/build -ti $$(cat .buildenvid)
