# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=proxygen
pkgver=2021.04.19.00
pkgrel=1
pkgdesc="A collection of C++ HTTP libraries including an easy to use HTTP server"
arch=('x86_64')
url="https://github.com/facebook/proxygen"
license=('BSD')
depends=('boost' 'boost-libs' 'folly' 'fizz' 'wangle' 'zstd' 'openssl' 'zlib' 'libcap' 'google-glog' 'gflags' 'fmt')
makedepends=('cmake' 'git' 'python' 'gperf' 'gperftools' 'gtest' 'gmock')
conflicts=('proxygen-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dda8ddc5208e4f8c953f7331868dd1fa2c375ed68adeabfa7d52ac03d501fae1')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTS=OFF -S . -B _build
  cmake --build _build
}

check() {
  cd "$pkgname-$pkgver"
  cmake --build _build --target test
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build _build --target install -- DESTDIR="$pkgdir/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}/external/http_parser/http_parser.h" \
                 "${pkgdir}/usr/include/${pkgname}/external/http_parser/http_parser.h"
}
