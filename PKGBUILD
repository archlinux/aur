# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='libdazzle-git'
pkgdesc='Companion library to GObject and GTK+'
license=('GPL3')
pkgver=r193.a86b759
pkgrel=1
provides=('libdazzle')
conflicts=('libdazzle')
makedepends=('meson' 'gobject-introspection' 'vala')
depends=('gtk3')
arch=('x86_64' 'i686')
url='https://github.com/chergert/libdazzle'
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')


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
