# maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=fizz
pkgver=2019.03.18.00
pkgrel=1
pkgdesc="C++14 implementation of the TLS-1.3 standard."
arch=('x86_64')
url="https://github.com/facebookincubator/fizz"
license=('BSD')
depends=()
makedepends=('folly' 'cmake' 'boost' 'libsodium' 'gmock')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('ed4fb4cfcddfa747d71055c6ba2236f11ba48ebc5ed161b1919b1eac090612c7')

prepare() {
    cd "$pkgname-$pkgver/fizz"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:string="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:string="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:string="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTS=ON \
        -DBUILD_EXAMPLES=OFF
}

build() {
    cd "$pkgname-$pkgver/fizz"
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver/fizz"
    cmake --build build -- test
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build fizz/build -- DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
