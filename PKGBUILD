# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
_pkgver=1.9.0-stable1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=(i686 x86_64)
url="https://sayonara-player.com/"
license=(GPL3)
depends=(qt5-base taglib gst-plugins-base gst-plugins-good)
makedepends=(git cmake qt5-tools qt5-svg gst-plugins-bad)
checkdepends=(xorg-server-xvfb)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("git+https://gitlab.com/luciocarreras/sayonara-player.git#tag=${_pkgver}")
sha512sums=('SKIP')

prepare() {
 cd "${srcdir}/${pkgname}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/${pkgname}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DWITH_TESTS=1
  make
}

check() {
  cd "${srcdir}/sayonara-player"
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' ctest --test-dir build --output-on-failure
}

package() {
  cd "${srcdir}/sayonara-player"
  DESTDIR="$pkgdir" cmake --install build
}
