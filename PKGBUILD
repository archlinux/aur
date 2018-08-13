# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='libdazzle-git'
pkgdesc='Companion library to GObject and GTK+'
license=('GPL3')
pkgver=3.29.4.r65.g5d6fd6c
pkgrel=1
provides=('libdazzle')
conflicts=('libdazzle')
makedepends=('meson' 'gobject-introspection' 'vala')
depends=('gtk3')
arch=('x86_64' 'i686')
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
	meson --buildtype release  \
		--prefix /usr \
		--sysconfdir /etc \
		--localstatedir /var \
		-Denable_gtk_doc=true \
		-Dwith_introspection=true \
		-Dwith_vapi=true \
		build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C "${pkgname}/build" install
}
