# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=fizz
pkgver=2022.08.22.00
pkgrel=1
pkgdesc="C++14 implementation of the TLS-1.3 standard"
arch=('x86_64')
url="https://github.com/facebookincubator/fizz"
license=('BSD')
depends=('boost' 'boost-libs' 'google-glog' 'folly' 'libevent' 'openssl' 'libsodium' 'fmt' 'double-conversion')
makedepends=('cmake' 'gtest' 'gmock')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8d69a4042e50fda8bde06a727c4bcbeff98364fdd09a75c8b59972e9c79708b5')

build() {
    cd "$pkgname-$pkgver/$pkgname"
    cmake -S . -B build \
          -DCMAKE_C_FLAGS:string="${CFLAGS}" \
          -DCMAKE_CXX_FLAGS:string="${CXXFLAGS}" \
          -DCMAKE_EXE_LINKER_FLAGS:string="${LDFLAGS}" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_TESTS=OFF \
          -DBUILD_EXAMPLES=OFF
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver/$pkgname"
    # cmake --build build --target test
}

package() {
    cd "$pkgname-$pkgver"
    cmake --build $pkgname/build --target install -- DESTDIR="$pkgdir/"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
