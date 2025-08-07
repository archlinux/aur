# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=osmin
pkgver=1.14.3
osmscoutver=${pkgver}
pkgrel=2

pkgdesc="Satellite Navigator & Tracker On-Road/Off-Road for Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/janbar/osmin"
license=('GPL-3.0-only')
depends=('openmp' 'qt6-5compat' 'qt6-location' 'qt6-multimedia' 'qt6-sensors' 'qt6-svg' 'qt6-wayland' 'qt6-remoteobjects' 'glfw' 'glm')
makedepends=('clang' 'cmake' 'double-conversion' 'tslib' 'xcb-util-image' 'xcb-util-keysyms')
source=("$url/archive/refs/tags/${pkgver}.tar.gz"
  "https://github.com/janbar/libosmscout/archive/refs/tags/${pkgname}-${osmscoutver}.tar.gz" )
sha256sums=('4995d67ee1dd5249b4656cb96b24a4c4c340382601681c8fa06cdff880990bf7'
            '634c2bef277e0c455709851eb0bfb7f794bcb845a0fa71cac17b87011e9f1474')

prepare() {
  # wire in the needed osmscout version
  osmscout_path="${pkgname}-${pkgver}/backend/libosmscout"
  rmdir "$osmscout_path"
  ln -sf "$PWD/libosmscout-${pkgname}-${osmscoutver}" "$osmscout_path"
  ( cd "${pkgname}-${pkgver}" && patch -p1 <../../osmin.patch; )
}

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_DEVICE_MOBILE=ON \
    -DCMAKE_C_COMPILER=/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -DCMAKE_BUILD_TYPE=Release . 
  cmake --build build/
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
