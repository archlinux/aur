# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
_pkgver=1.11.0-stable1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=(i686 x86_64)
url="https://sayonara-player.com/"
license=(GPL3)
depends=(qt5-base qt5-svg taglib gst-plugins-base gst-plugins-good)
makedepends=(git cmake qt5-tools gst-plugins-bad)
checkdepends=(xorg-server-xvfb)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("git+https://gitlab.com/luciocarreras/sayonara-player.git#tag=${_pkgver}")
sha512sums=('a25c50d29e37a5bc6f942c8471eee308b3fe42359f59e094cdc67b53b2148c0208aa19223c36d989b397f8abe716230749516ad22d664d3a1dcd76f58df2a3fe')

build() {
  local _flags=(
    -DWITH_TESTS=1
  )

  cmake -B build -S "sayonara-player" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

check() {
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
