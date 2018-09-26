# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.6.1
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64' 'i686')
url="https://github.com/mujx/nheko"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'hicolor-icon-theme' 'lmdb' 'cmark' 'mtxclient')
makedepends=('cmake' 'boost' 'qt5-tools' 'nlohmann-json' 'lmdbxx' 'spdlog' 'tweeny')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mujx/nheko/archive/v$pkgver.tar.gz")
sha512sums=('1485bf88e98fc90abdba68a6461ae698fc3c108a1c1de32ae921be2afa242ba8be3def6003d1ec045e7adba2ccd9f582fa67502ea56eb3f430782b0d4aae5abe')

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

