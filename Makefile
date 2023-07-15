.PHONY: all check chrootpkg patch release

all:
	makepkg -sd

check:
	namcap PKGBUILD

## Build the package using devtools.
##
## We bind the host go, go-build cache, and .gradle cache to the
## chroot/build to minimize re-downloading Go and Java dependencies on the
## next rebuild.
chrootpkg:
	mkdir -p $$HOME/go
	mkdir -p $$HOME/.cache/go-build
	mkdir -p $$HOME/.gradle
	mkdir -p _build
	mkarchroot _build/root base-devel systemd || exit 0
	arch-nspawn -c /var/cache/pacman/pkg _build/root \
		pacman -Syu --noconfirm --color=never
	arch-nspawn -c /var/cache/pacman/pkg _build/$$(whoami) \
		pacman -Syu --noconfirm --color=never
	makechrootpkg \
		-d $$HOME/.cache/go-build:/build/.cache/go-build \
		-d $$HOME/.gradle:/build/.gradle \
		-d $$HOME/go:/build/go \
		-d /tmp \
		-r _build \
		-- --noconfirm --needed --nocolor

patch:
	git -C src/google-cloud-ops-agent-git diff > 0001-build-sh.patch
	makepkg --noextract --nobuild --geninteg

release:
	makepkg --printsrcinfo > .SRCINFO
