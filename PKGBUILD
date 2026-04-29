# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openapv
pkgver=0.2.1.3
pkgrel=1
pkgdesc='The reference implementation of the APV codec'
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/openapv/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/AcademySoftwareFoundation/openapv/archive/v${pkgver}-fix/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b91fbb047869899836aec179e5546a969894a67e2b82f865c87089043a06dd00')

build() {
    CFLAGS+=' -ffat-lto-objects'
    cmake -B build -S "${pkgname}-${pkgver}-fix" \
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
    install -D -m644 "${pkgname}-${pkgver}-fix/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
