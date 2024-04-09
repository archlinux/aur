# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libultrahdr
pkgver=1.0.0
pkgrel=2
pkgdesc='Codec for the Ultra HDR format'
arch=('x86_64')
url='https://github.com/google/libultrahdr/'
license=('Apache-2.0')
depends=('gcc-libs' 'libjpeg')
makedepends=('cmake')
source=("https://github.com/google/libultrahdr/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'libuhdr.pc'
        '010-libultrahdr-use-system-libjpeg.patch'
        '020-libultrahdr-build-shared-library.patch')
sha256sums=('385755c691e17f960e9282f4f86bcfa20a3f537954fee6fefeed65f095312b49'
            '7aad3e1089551f75a906827453d5a672ff3a13847a2a47dd4a2a0c583acc7499'
            'be1ea4c56add2c3a4549490c3c55b042317507d1fc93a09afcbdce216b6e455a'
            '8837eac142bc7ca6525f54296f09b4f496244a2c55cee115a2a960380c48a8a2')

prepare() {
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-libultrahdr-use-system-libjpeg.patch"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/020-libultrahdr-build-shared-library.patch"
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Wno-dev
    cmake --build build
}

package() {
    install -D -m755 build/ultrahdr_app -t "${pkgdir}/usr/bin"
    install -D -m644 build/libultrahdr.so -t "${pkgdir}/usr/lib"
    install -D -m644 libuhdr.pc -t "${pkgdir}/usr/lib/pkgconfig"
    install -D -m644 "${pkgname}-${pkgver}/include/ultrahdr/ultrahdr.h" -t "${pkgdir}/usr/include"
    ln -s ultrahdr.h "${pkgdir}/usr/include/ultrahdr_api.h"
    ln -s libultrahdr.so "${pkgdir}/usr/lib/libuhdr.so"
}
