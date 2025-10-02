# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=osmin
pkgver=1.14.5
pkgrel=1
osmscoutcommit="1296f6c937936b7241d3f4f304ec4f23ece90fb6"
pkgdesc="Satellite Navigator & Tracker On-Road/Off-Road for Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/janbar/osmin"
license=('GPL-3.0-only')
depends=('openmp' 'qt6-5compat' 'qt6-location' 'qt6-multimedia' 'qt6-sensors' 'qt6-svg' 'qt6-wayland' 'qt6-remoteobjects' 'glfw' 'glm')
makedepends=('clang' 'cmake' 'double-conversion' 'tslib' 'xcb-util-image' 'xcb-util-keysyms')
source=("$url/archive/refs/tags/${pkgver}.tar.gz"
  "https://github.com/janbar/libosmscout/archive/${osmscoutcommit}.tar.gz"
  "osmin.patch")
sha256sums=('5d8678bf2abac5655d2b556ff763be054fa695197ce9a395e8682bba84327db0'
            '206ee97a421b76572b00ec61be1b04f02df88f3eff52a7730ea258aa1f5026b1'
            '3b215c8bd6c417537acc26d9cf43f960109c305f8f7bcb14787bb664cce3825b')

prepare() {
  # wire in the needed osmscout version
  osmscout_path="${pkgname}-${pkgver}/backend/libosmscout"
  rmdir "$osmscout_path"
  ln -sf "$PWD/libosmscout-${osmscoutcommit}" "$osmscout_path"
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
