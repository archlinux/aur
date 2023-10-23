# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist
pkgver=0.2.9
pkgrel=1
pkgdesc='A library that can be used to add the RIST protocol to applications'
arch=('x86_64')
url='https://code.videolan.org/rist/librist/'
license=('BSD')
depends=('cjson' 'mbedtls')
makedepends=('meson' 'cmake' 'cmocka' 'lz4')
source=("https://code.videolan.org/rist/librist/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2"
        '010-librist-disable-multicast-tests.patch')
sha256sums=('3fb9dacd4683c31f5f3efb152615d993ec6769f60f25009f5f1dc022483348a9'
            '0b8363a832a0e20ee756936efde714acaa3dfa74cffa1ef8283f3373663d0e35')

prepare() {
    patch -d "${pkgname}-v${pkgver}" -Np1 -i "${srcdir}/010-librist-disable-multicast-tests.patch"
}

build() {
    arch-meson build "${pkgname}-v${pkgver}"
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 "${pkgname}-v${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
