# Maintainer: rafaelff <rafaelff@gnome.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <maister@archlinux.us>
# Contributor: WeirdBeard <obarrtimothy@gmail.com>

pkgname=pcsx2-git
pkgver=1.7.0.r188.91326e1d9
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=(x86_64)
url=https://www.pcsx2.net
license=(
  GPL2
  GPL3
  LGPL2.1
  LGPL3
)

depends=(
  libaio
  libjpeg-turbo
  libpcap
  libpulse
  portaudio
  sdl2
  soundtouch
  wxgtk2
)
makedepends=(
  cmake
  git
  xorgproto
)
provides=(pcsx2)
conflicts=(pcsx2)
source=(git+https://github.com/PCSX2/pcsx2.git)
sha256sums=(SKIP)

pkgver() {
  cd pcsx2

  git describe --tags | sed 's/^v//; s/-dev//; s/-/.r/; s/-g/./'
}

build() {
  mkdir -p build
  cd build

  cmake ../pcsx2 \
    -DCMAKE_TOOLCHAIN_FILE=cmake/linux-compiler-i386-multilib.cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DPLUGIN_DIR=/usr/lib32/pcsx2 \
    -DGAMEINDEX_DIR=/usr/share/pcsx2 \
    -DPACKAGE_MODE=ON \
    -DXDG_STD=TRUE
  make
}

package() {
  make DESTDIR="$pkgdir" -C build install
}

# vim: ts=2 sw=2 et:
