# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
_pkgver=1.12.0-stable1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=(i686 x86_64)
url="https://sayonara-player.com/"
license=(GPL-3.0-or-later)
depends=(
    glib2
    glibc
    gst-plugins-base
    gst-plugins-base-libs
    gstreamer
    hicolor-icon-theme
    libgcc
    libstdc++
    python
    python-dbus
    qt5-base
    qt5-svg
    taglib
    zlib
    )
makedepends=(
    cmake
    git
    gst-plugins-bad
    qt5-tools
    )
checkdepends=(
    xorg-server-xvfb
    )
optdepends=(
    'gst-libav: additional codecs'
    'gst-plugins-bad: additional codecs'
    'gst-plugins-ugly: additional codecs'
    )
source=("git+https://gitlab.com/luciocarreras/sayonara-player.git#tag=${_pkgver}")
sha512sums=('ff1a808e73dda9f9b6ec4f9b88dad9f73e253a523be4ad4ba2f498e5393b6a5ba2da6641063bb8407d0d85a433a127eba912f861e0674166f0080a607b433efc')

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
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' ctest --test-dir build --output-on-failure || :
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
