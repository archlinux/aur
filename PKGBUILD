# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=fizz
pkgver=2019.11.11.00
pkgrel=1
pkgdesc="C++14 implementation of the TLS-1.3 standard"
arch=('x86_64')
url="https://github.com/facebookincubator/fizz"
license=('BSD')
depends=('boost' 'boost-libs' 'google-glog' 'folly' 'openssl' 'libsodium')
makedepends=('cmake' 'gtest' 'gmock')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0a6b3778cf841f67918b3ed1e2c2eb67237d9ca442ec9473a1ff15395a503357')

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
