# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=fizz
pkgver=2020.02.24.00
pkgrel=1
pkgdesc="C++14 implementation of the TLS-1.3 standard"
arch=('x86_64')
url="https://github.com/facebookincubator/fizz"
license=('BSD')
depends=('boost' 'boost-libs' 'google-glog' 'folly' 'libevent' 'openssl' 'libsodium' 'fmt' 'double-conversion')
makedepends=('cmake' 'gtest' 'gmock')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b3309da5d414b917c8002b46852de22666741c6070b046b00c101bedf57c77ff')

build() {
    cd "$pkgname-$pkgver/$pkgname"
    cmake -S . -B build \
          -DCMAKE_C_FLAGS:string="${CFLAGS}" \
          -DCMAKE_CXX_FLAGS:string="${CXXFLAGS}" \
          -DCMAKE_EXE_LINKER_FLAGS:string="${LDFLAGS}" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_TESTS=ON \
          -DBUILD_EXAMPLES=OFF
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver/$pkgname"
    cmake --build build --target test
}

package() {
    cd "$pkgname-$pkgver"
    cmake --build $pkgname/build --target install -- DESTDIR="$pkgdir/"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
