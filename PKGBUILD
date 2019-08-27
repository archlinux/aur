# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=fizz
pkgver=2019.08.26.00
pkgrel=1
pkgdesc="C++14 implementation of the TLS-1.3 standard"
arch=('x86_64')
url="https://github.com/facebookincubator/fizz"
license=('BSD')
depends=('boost' 'boost-libs' 'google-glog' 'folly' 'openssl' 'libsodium')
makedepends=('cmake' 'gtest' 'gmock')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d8751f772f6773d082c55601ada15129e8b8fdb427a910cc89aa776efecf7d26')

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
