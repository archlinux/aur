# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.6.0
pkgrel=2
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64' 'i686')
url="https://github.com/mujx/nheko"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'hicolor-icon-theme' 'lmdb' 'cmark' 'mtxclient')
makedepends=('cmake' 'boost' 'qt5-tools' 'nlohmann-json' 'lmdbxx' 'spdlog' 'tweeny')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mujx/nheko/archive/v$pkgver.tar.gz")
sha512sums=('ebdbb74e1ab57dc8cdb350b01fcf1869a0bf8394eddd565cb89adcb24140d0bb4dddc486fc3d49e22522fd465f952eb027b4c104282955acea270257f246c7a1')

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

