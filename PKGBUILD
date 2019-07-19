# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wltrunk-git
pkgdesc='High-level Wayland compositor library based on wlroots'
pkgver=r51.a9a5fee
pkgrel=1
url='https://git.sr.ht/~bl4ckb0ne/wltrunk'
license=(custom:as-is)
arch=(x86_64)
makedepends=(meson ninja git wayland-protocols)
conflicts=(wltrunk)
provides=(wltrunk)
depends=(wlroots)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^version\.//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	rm -rf build
	arch-meson -Dtrunkston=false "${pkgname}" build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}
