# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='bspwc-git'
pkgver=r30.b3d0da3
pkgrel=2
license=(custom:as-is)
pkgdesc='Wayland compositor based on BSPWM'
url='https://git.sr.ht/~bl4ckb0ne/bspwc'
arch=(x86_64)
provides=(bspwc)
conflicts=(bspwc)
depends=(wltrunk-git wlroots-git)
makedepends=(meson ninja git wayland-protocols)
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')


pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^version\.//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	rm -rf build
	meson build --prefix /usr
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C "${pkgname}/build" install
}
