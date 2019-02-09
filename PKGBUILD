# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mtxclient
pkgver=0.2.0
pkgrel=2
pkgdesc="Client API library for Matrix, built on top of Boost.Asio<Paste>"
arch=('x86_64' 'i686')
url="https://github.com/mujx/mtxclient"
license=('MIT')
depends=('libolm' 'libsodium' 'openssl' 'boost-libs')
makedepends=('cmake' 'nlohmann-json' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mujx/mtxclient/archive/v$pkgver.tar.gz")
sha256sums=('e7638d4a8233c0c763d48111fd13e8ad1dcd5f34e3e641b46eaf1bb920b73482')

prepare() {
  mkdir -p build
  # Fix up includes to nlohmann json
  grep -rl '#include <json.hpp>' | xargs sed -i 's|#include <json.hpp>|#include <nlohmann/json.hpp>|'
  grep -rl '#include "json.hpp"' | xargs sed -i 's|#include "json.hpp"|#include <nlohmann/json.hpp>|'
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_LIB_TESTS=OFF \
    -DBUILD_LIB_EXAMPLES=OFF \
    -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
