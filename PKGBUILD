# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-crypto-git
pkgver=1.0.2.r0.g01eefa3
pkgrel=1
pkgdesc='C++ interface for calling existing cryptography libraries (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD-2-Clause')
makedepends=('git' 'cmake' 'catch2-v2')
provides=('cs-crypto')
conflicts=('cs-crypto')
source=('git+https://github.com/copperspice/cs_crypto.git')
sha256sums=('SKIP')

pkgver() {
    git -C cs_crypto describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^crypto\.//;s/^v//'
}

build() {
    cmake -B build -S cs_crypto \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 cs_crypto/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
