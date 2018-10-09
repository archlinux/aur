# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.6.2
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64' 'i686')
url="https://github.com/mujx/nheko"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'hicolor-icon-theme' 'lmdb' 'cmark' 'mtxclient')
makedepends=('cmake' 'boost' 'qt5-tools' 'nlohmann-json' 'lmdbxx' 'spdlog' 'tweeny')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mujx/nheko/archive/v$pkgver.tar.gz")
sha512sums=('dc4f5b8c6e58b5c21b73c8ec7d02d874f6e3ede381df2a2e0c9ecdfca3397f1dcfce5f59a89fe0805da01086c33e05d44faf722bfb3d178aba532cb24b0ff08b')

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

