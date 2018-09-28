# maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=fizz
pkgver=2018.09.24.00
pkgrel=1
pkgdesc="C++14 implementation of the TLS-1.3 standard."
arch=('x86_64')
url="https://github.com/facebookincubator/fizz"
license=('BSD')
depends=()
makedepends=('folly' 'cmake' 'boost' 'libsodium')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('869d3a1e7f178404236f9797d0c0aba0ac0046315290bef5eff15563473ace4f')

prepare() {
    cd "$pkgname-$pkgver/fizz"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:string="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:string="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:string="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
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
  cmake --build fizz/build -- install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
