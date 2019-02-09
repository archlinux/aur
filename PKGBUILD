# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.6.3
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64' 'i686')
url="https://github.com/Nheko-Reborn/nheko"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'hicolor-icon-theme' 'lmdb' 'cmark' 'mtxclient')
makedepends=('cmake' 'boost' 'qt5-tools' 'nlohmann-json' 'lmdbxx' 'spdlog' 'tweeny')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nheko-Reborn/nheko/archive/v$pkgver.tar.gz")
sha512sums=('cc4637b9c9e7135367c38f96c14f3ddfef1444e2ad4a916e3431104d4c4a35c1274f4a7dd428edb7a05d8b4c1f99a7fb422d7fd24e78c3409efb72398532688e')

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
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

