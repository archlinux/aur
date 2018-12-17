# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=amber-theme-git
pkgver=r129.140bde6
pkgrel=1
pkgdesc='GTK+ and GNOME Shell theme based on the Ubuntu Ambiance theme'
url=https://github.com/lassekongo83/amber-theme
license=(GPL)
makedepends=(meson ninja sassc)
arch=(any)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	rm -rf "${srcdir}/build"
}

build () {
	arch-meson "${srcdir}/build" "${srcdir}/${pkgname}"
	ninja -C "${srcdir}/build"
}


package () {
	DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
}
