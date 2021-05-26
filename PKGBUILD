# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=librist
pkgver=0.2.0
pkgrel=1
pkgdesc='A library that can be used to add the RIST protocol to applications'
arch=('x86_64')
url='https://code.videolan.org/rist/librist/'
license=('BSD')
depends=('cjson' 'mbedtls')
makedepends=('meson' 'cmake' 'cmocka' 'lz4')
BUILDENV=('!check')
source=("https://code.videolan.org/rist/librist/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2"
        '010-librist-gcc11-fix.patch')
sha256sums=('10abfc4321762b12cce8d57b2ed2cc16c8baf1535f2d19df39fe9429d20d6de9'
            '462003e930c8d83d0c43e92bbb3b65a013dbb56e8642d894ebd22e962e8cc94b')

prepare() {
    patch -d "${pkgname}-v${pkgver}" -Np1 -i "${srcdir}/010-librist-gcc11-fix.patch"
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
