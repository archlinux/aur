# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='A simple VTE-based terminal, aperezdc fork'
pkgname=termite-aperezdc
pkgver=15.1
pkgrel=3
url=https://github.com/aperezdc/termite
license=(LGPL)
depends=(gtk3 pcre2 gnutls vte-common)
makedepends=(gperf 'meson>=0.58' ninja)
conflicts=(termite termite-git)
provides=(termite)
arch=(x86_64)
backup=(etc/xdg/termite/config)
validpgpkeys=(5AA3BC334FD7E3369E7C77B291C559DBE4C9123B)
source=("${url}/releases/download/v${pkgver}/termite-${pkgver}.tar.xz"{,.asc})
sha512sums=('075d5f37396bbf6dbe5850d9cae65209cf1e8da6d6f9b869d932da236f0fcb62b3dc8baf504d9ce7c2573c21bc4c0baf359b9b45d296514a89ead33fa0992e06'
            'SKIP')

build () {
	rm -rf _build
	arch-meson _build "termite-${pkgver}" -Db_lto=false
	meson compile -C _build
}

package () {
	meson install -C _build --skip-subprojects vte --destdir "${pkgdir}"

	# Fix wrong config file location
	mv "${pkgdir}/etc/etc/xdg" "${pkgdir}/etc"
	rmdir "${pkgdir}/etc/etc"
}
