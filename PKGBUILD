# Maintainer: rafaelff <rafaelff@gnome.org>, WeirdBeard <obarrtimothy@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <maister@archlinux.us>

pkgname=pcsx2-git
pkgver=1.7.3519.r373.gd2dd796cb
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

install=post.install

OPTIONS+=(
  epoch = 1
)

depends=('rapidyaml>=0.4')

depends=(
  libaio
  libjpeg-turbo
  libpcap
  libzip
  libgl # For Steam Deck
  xorg-xrandr # For Steam Deck
  libxrender # For Steam Deck
  linux-api-headers # For Steam Deck
  libpulse
  portaudio
  libsamplerate
  sdl2
  rapidyaml
  qt6-base
  qt6-wayland
  qt6-tools
  qt6-svg
  soundtouch
  wayland
  zstd
)
makedepends=(
  cmake
  git
  xorgproto
  ninja
  swig
  python
  vulkan-headers
)

provides=(pcsx2-qt)

conflicts=(pcsx2)

source=(
git+https://github.com/PCSX2/pcsx2.git
0001-QtHost.cpp-Fixed-Resources-dir.patch
0002-Added-QT-Desktop-file.patch
)

prepare()
{
  cd $srcdir/pcsx2
  git submodule update --init --recursive
  git apply -3 "${srcdir}/0001-QtHost.cpp-Fixed-Resources-dir.patch"
  git apply -3 "${srcdir}/0002-Added-QT-Desktop-file.patch"

  export CMAKE_C_COMPILER=/usr/bin/clang-12
  export CMAKE_CXX_COMPILER=/usr/bin/clang++-12
  export CMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld"
  export CMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld"
}

pkgver()
{
  cd $srcdir/pcsx2
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build()
{
  mkdir -p build
  cd build

  cmake ../pcsx2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DWAYLAND_API=ON \
    -DQT_BUILD=ON \
    -DXDG_STD=TRUE \
    -DUSE_VULKAN=ON \
    -DDISABLE_ADVANCE_SIMD=ON \
    -GNinja \
    -DPACKAGE_MODE=ON \
    -DDISABLE_SETCAP=ON
  ninja -j$(nproc)
}

package()
{
    DESTDIR="${pkgdir}" cmake --install build
}

# vim: ts=2 sw=2 et:

sha256sums=('SKIP'
            '88207a76ba366a343b5b9d8f90da0f44f2dd8145df0ad7582c223ff072528473'
            '33b3d6bde2c3973db918a28d4eacbef6e5db4be65856091988364f840d3702e1')
