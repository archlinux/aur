# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Terminal top-like monitor for icecream/icecc'
pkgname='icetop-git'
pkgver=r37.48482f3
pkgrel=1
license=('GPL2')
arch=('x86_64' 'i686')
depends=('icecream' 'libdill' 'libtickit-bzr')
makedepends=('meson' 'ninja')
url='https://github.com/aperezdc/icetop'
source=("${pkgname}::git+${url}")
sha512sums=("SKIP")

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	meson --buildtype release --prefix /usr build
	ninja -C build
}

package () {
	cd "${pkgname}"
	DESTDIR="${pkgdir}" ninja -C build install
}
