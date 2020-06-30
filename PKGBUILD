# Maintainer: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack-git
pkgver=r6186
pkgrel=1
pkgdesc="An application dedicated to tracking user's head movements and relaying the information to games and flight simulation software"
arch=('i686' 'x86_64')
url="https://github.com/opentrack/opentrack/"
license=('GPL3')
depends=('qt5-base' 'opencv')
makedepends=('cmake' 'xplane-sdk-devel' 'wine' 'ninja')
provides=('opentrack')
conflicts=('opentrack')
source=("git+https://github.com/opentrack/opentrack.git" "opentrack.desktop")
sha256sums=('SKIP'
            '40f856cae6f8651fbbc37666b9d5ef35c3aa2399cd28f8b89d411bfc1ad871e7')

pkgver() {
  cd "$srcdir/opentrack"
  printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd opentrack
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
  cd opentrack/build
  DESTDIR="$pkgdir" ninja install

  install -Dm644 $srcdir/opentrack.desktop $pkgdir/usr/share/applications/opentrack.desktop
}

