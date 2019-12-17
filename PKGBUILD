# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Themaister <maister@archlinux.us>

pkgname=pcsx2-git
pkgver=1.5.0.r3322.aa03c8312
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
  lib32-glew
  lib32-libaio
  lib32-libcanberra
  lib32-libjpeg-turbo
  lib32-libpcap
  lib32-libpulse
  lib32-portaudio
  lib32-sdl2
  lib32-soundtouch
  lib32-wxgtk2
)
makedepends=(
  clang
  cmake
  git
  lib32-libglvnd
  png++
)
provides=(pcsx2)
conflicts=(pcsx2)
source=(git+https://github.com/PCSX2/pcsx2.git)
sha256sums=(SKIP)

pkgver() {
  cd pcsx2

  git describe --tags | sed 's/^v//; s/-dev//; s/-/.r/; s/-g/./'
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  # Disable ZeroGS and ZZOgl-PG
  rm -rf pcsx2/plugins/{zerogs,zzogl-pg}
}

build() {
  cd build

  export CC=clang
  export CXX=clang++
  export CXXFLAGS="$CXXFLAGS -I/usr/include/harfbuzz"

  cmake ../pcsx2 \
    -DCMAKE_TOOLCHAIN_FILE=cmake/linux-compiler-i386-multilib.cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DPLUGIN_DIR=/usr/lib32/pcsx2 \
    -DGAMEINDEX_DIR=/usr/share/pcsx2 \
    -DEXTRA_PLUGINS=ON \
    -DREBUILD_SHADER=ON \
    -DGLSL_API=ON \
    -DPACKAGE_MODE=ON \
    -DXDG_STD=ON
  make
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

# vim: ts=2 sw=2 et:
