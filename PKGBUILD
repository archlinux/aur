# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=loupe-git
pkgver=r79.ca3c02a
pkgrel=1
pkgdesc='Simple image viewer for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/BrainBlasted/loupe'
license=(GPL)
depends=(libadwaita)
makedepends=(
	git
	itstool
	meson
	rust
)
provides=(loupe)
conflicts=(loupe)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd loupe
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	arch-meson loupe build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
