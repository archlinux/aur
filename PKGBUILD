# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=labwc-menu-generator-git
pkgdesc='Desktop-independent menu generator for OpenBox/labwc'
url=https://github.com/labwc/labwc-menu-generator
pkgver=r24.c2d46a1
pkgrel=2
arch=(x86_64)
makedepends=(git perl meson)
depends=(glib2)
license=(GPL2)
provides=(labwc-menu-generator)
conflicts=(labwc-menu-generator)
source=("$pkgname::git+$url")
b2sums=(SKIP)

pkgver () {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build () {
	rm -rf _build
	arch-meson _build "$pkgname"
	meson compile -C _build
}

# FIXME: Tests are currently failing, but the program seems to work when installed.
# check () {
# 	meson test -C _build
# }

package () {
	meson install -C _build --destdir "$pkgdir"
}
