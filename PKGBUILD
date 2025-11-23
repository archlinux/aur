# Maintainer: Frederik Schwan <freswa@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Julien Virey <julien.virey@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='A simple VTE-based terminal'
pkgname=termite
pkgver=16.9
pkgrel=8
url=https://github.com/aperezdc/termite
license=(LGPL-2.1-only)
depends=(gtk3 pcre2 gnutls vte-common)
makedepends=(git gperf 'meson>=1.0' ninja glib2-devel)
arch=(x86_64)
backup=(etc/xdg/termite/config)
validpgpkeys=(5AA3BC334FD7E3369E7C77B291C559DBE4C9123B)
source=(
    "${url}/releases/download/v${pkgver}/termite-${pkgver}.tar.lz"{,.asc}
    vte.patch
    )
b2sums=('97a11784f4ed1bd602578e11f91f11b882d6f7750a0c51a56d5560c7bbf83b1df3af79a64965c436130a6248ecf9fb86dd58c4d4bd6e5b70408a70815bdb5d32'
        'SKIP'
        '33bd16a6e3fc4379aa89c502b63a26d9f84e9a1ef959c5d262b574ae69cb255f01745f966139936b76f5e25d47ee9e03b7bdc169969bebdce3676781c2464a07')

prepare() {
    cd "${pkgname}-${pkgver}"
    # Remove old vte version
    rm -rf subprojects/vte
    # Patch wrap with version 0.82.1
    patch -p1 < ../vte.patch
}

build () {
	rm -rf _build
	arch-meson --wrap-mode=forcefallback _build "${pkgname}-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --skip-subprojects vte --destdir "${pkgdir}"
}
