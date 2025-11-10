# Maintainer: Frederik Schwan <freswa@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Julien Virey <julien.virey@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='A simple VTE-based terminal'
pkgname=termite
pkgver=16.9
pkgrel=7
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
        '67b1d49127ed09b10306289598b386a08fb8c640ccd9f8d50024b12fd8a65175f3e98c30069ad05a8b46fcb364fb1cc502b655442b527574860b9ae8e2a3c0e9')

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
