# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>

pkgname=wangle
pkgver=2024.01.22.00
pkgrel=1
pkgdesc="C++ networking library providing client/server abstractions for building services"
arch=('x86_64')
url="https://github.com/facebook/wangle"
license=('Apache-2.0')
depends=(
  'double-conversion'
  'fizz'
  'fmt'
  'folly'
  'gcc-libs'
  'gflags'
  'glibc'
  'google-glog'
  'openssl'
)
makedepends=(
  'boost'
  'cmake'
  'gtest'
)
provides=(libwangle.so)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e29a68f293c0aa3bd9e5c2e0a137d7a0c4e86c26737344f1d1671d0984e3ff09')

build() {
  cd "$pkgname-$pkgver/$pkgname"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DPACKAGE_VERSION="${pkgver}"
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver/$pkgname"

  ctest --test-dir build --output-on-failure \
    -E SSLContextManagerTest
}

package() {
  cd "$pkgname-$pkgver/$pkgname"

  DESTDIR="${pkgdir}" cmake --install build

  # Remove empty directories to avoid namcap warnings
  rm -r "${pkgdir}/usr/include/wangle/service/test"
  rm -r "${pkgdir}/usr/include/wangle/ssl/test/certs"
  rm -r "${pkgdir}/usr/include/wangle/util/test"
}
