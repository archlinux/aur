# Maintainer: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack
pkgver=2.3rc11
_pkgver=2.3-rc99p11
pkgrel=1
pkgdesc="An application dedicated to tracking user's head movements and relaying the information to games and flight simulation software"
arch=('i686' 'x86_64')
url="https://github.com/opentrack/opentrack/"
license=('GPL3')
depends=('qt5-base' 'opencv')
makedepends=('cmake' 'xplane-sdk-devel' 'wine')
source=("https://github.com/opentrack/opentrack/archive/opentrack-$_pkgver.tar.gz" "opentrack.desktop")
sha256sums=('3607c37a0259c9320d3cbb687e0b8e477e511e304dad7b8933ca6a57e8adb4c3'
            'e39d8d68739f875393c4b0bec61aacf5d2fa7970327c82d9b4e97f643e4fb0cc')

build() {
  cd opentrack-opentrack-$_pkgver 
  mkdir -p build
  cd build
  # fix path for xplane plugin
  sed -i 's/..\/opentrack-compat\/export.hpp/..\/compat\/export.hpp/' ../x-plane-plugin/plugin.c
  mkdir -p xplane_sdk/CHeaders
  ln -sf /usr/include/xplane_sdk/Wrappers xplane_sdk/CHeaders/
  ln -sf /usr/include/xplane_sdk/Widgets xplane_sdk/CHeaders/
  ln -sf /usr/include/xplane_sdk/XPLM xplane_sdk/CHeaders/
  cmake -DCMAKE_BUILD_TYPE=Release -DSDK_ENABLE_LIBEVDEV=ON -DSDK_XPLANE=xplane_sdk -DSDK_WINE_PREFIX=/ -DCMAKE_INSTALL_PREFIX=/opt/opentrack ..
  make
}

package() {
  cd opentrack-opentrack-$_pkgver/build
  make DESTDIR="$pkgdir" install

  install -Dm644 $srcdir/opentrack.desktop $pkgdir/usr/share/applications/opentrack.desktop
}

