# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openapv
pkgver=0.2.0.3
pkgrel=1
pkgdesc='The reference implementation of the APV codec'
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/openapv/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/AcademySoftwareFoundation/openapv/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9da0f758534d6243cd6e5c5ca46404e6fdd7e298a17da50b676b71c53ce6a083')

build() {
    CFLAGS+=' -ffat-lto-objects'
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DOAPV_APP_STATIC_BUILD:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
