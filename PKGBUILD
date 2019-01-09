# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Companion library to GObject and GTK+'
pkgname=libdazzle-git
license=(GPL3)
pkgver=3.31.1.r40.ga714ac9
pkgrel=1
provides=(libdazzle)
conflicts=(libdazzle)
makedepends=(meson gobject-introspection vala git)
depends=(gtk3)
arch=(x86_64 i686)
url='https://gitlab.gnome.org/GNOME/libdazzle'
source=("${pkgname}::git+${url}.git/")
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
	rm -rf build
	arch-meson \
		-Denable_gtk_doc=true \
		-Dwith_introspection=true \
		-Dwith_vapi=true \
		build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C "${pkgname}/build" install
}
