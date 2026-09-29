# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openapv
pkgver=1.1.2.0
pkgrel=1
pkgdesc='The reference implementation of the APV codec'
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/openapv/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/AcademySoftwareFoundation/openapv/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('970f65255896c906b22d7c9f9850deeee03fecf001415804848a03b6d1bbe41a')

build() {
    CFLAGS+=' -ffat-lto-objects'
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DOAPV_APP_STATIC_BUILD:BOOL='OFF' \
        -Wno-author
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
