# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist
pkgver=0.2.3
pkgrel=1
pkgdesc='A library that can be used to add the RIST protocol to applications'
arch=('x86_64')
url='https://code.videolan.org/rist/librist/'
license=('BSD')
depends=('cjson' 'mbedtls')
makedepends=('meson' 'cmake' 'cmocka' 'lz4')
source=("https://code.videolan.org/rist/librist/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2"
        '010-librist-disable-multicast-tests.patch')
sha256sums=('6ef1b3bd794daaa00cf1fc2d8ca5aaba7d8ad1d9c688a21cdd14243f34fb3515'
            '60004953f606bb96418be5dcc6bae2fa0883ce83c4f2246f33a2eda8c9c5a56b')

prepare() {
    patch -d "${pkgname}-v${pkgver}" -Np1 -i "${srcdir}/010-librist-disable-multicast-tests.patch"
}

build() {
    arch-meson build "${pkgname}-v${pkgver}"
    ninja -v -C build
}

check() {
    ninja -v -C build test
}

package() {
    DESTDIR="$pkgdir" ninja -v -C build install
    install -D -m644 "${pkgname}-v${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
