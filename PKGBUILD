# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player-beta
_pkgver=1.11.0-beta1
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="Small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=(i686 x86_64)
url="https://sayonara-player.com"
license=(GPL3)
depends=(qt5-base qt5-svg gst-plugins-base taglib python)
makedepends=(cmake git qt5-tools)
checkdepends=(xorg-server-xvfb gst-plugins-good)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-good: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
provides=(sayonara-player)
conflicts=(sayonara-player)
source=("git+https://gitlab.com/luciocarreras/sayonara-player.git#tag=${_pkgver}")
sha512sums=('052ec9d5a13e9d362aaeeb25c805a4ef5311264115fa9965eeeefc5e6806dabd089efb0f294f1c2f209c83afc9bbb6aec418a6d126148dd5f0c67dc74cdaf807')

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
