# Maintainer: Daniel Pierce <moofed@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack
pkgver=2023.1.0
pkgrel=1
pkgdesc="Head tracking software"
arch=('x86_64')
url="https://github.com/opentrack/opentrack/"
license=('GPL3')
depends=('qt5-base' 'opencv')
makedepends=('cmake' 'xplane-sdk-devel' 'wine' 'ninja' 'qt5-tools')
source=("https://github.com/opentrack/opentrack/archive/opentrack-$pkgver.tar.gz" "opentrack.desktop")
sha256sums=('f92e778ad5cee0ebab8c1c2b42beb3aebd8f9a1d586430f3cf69860800430ee7'
            '96b4a633d40f399b927d159353cfaa679d2148156a3f04b5ea23b8d4b8e4bd3f')

build() {
  cd opentrack-opentrack-$pkgver

  mkdir -p build
  cd build

  # fix path for xplane plugin
  sed -i 's/..\/opentrack-compat\/export.hpp/..\/compat\/export.hpp/' ../x-plane-plugin/plugin.c
  mkdir -p xplane_sdk/CHeaders
  ln -sf /usr/include/xplane_sdk/Wrappers xplane_sdk/CHeaders/
  ln -sf /usr/include/xplane_sdk/Widgets xplane_sdk/CHeaders/
  ln -sf /usr/include/xplane_sdk/XPLM xplane_sdk/CHeaders/
  cmake .. \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DSDK_XPLANE=xplane_sdk \
      -DSDK_WINE=ON \
      -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd opentrack-opentrack-$pkgver/build
  DESTDIR="$pkgdir" ninja install

  install -Dm644 $srcdir/opentrack.desktop $pkgdir/usr/share/applications/opentrack.desktop
}

