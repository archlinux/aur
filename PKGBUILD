# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: vEX <vex@niechift.com>

pkgname=pcsx2
pkgver=1.7.3753
pkgrel=2
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
  glibc
  libaio.so
  libasound.so
  libfmt.so
  libgl
  libharfbuzz.so
  libpcap.so
  libpng
  libpulse.so
  libsamplerate.so
  libudev.so
  libx11
  libxcb
  libxrandr
  libzip.so
  libzstd.so
  qt6-base
  sdl2
  soundtouch
  xz
  zlib
)
makedepends=(
  cmake
  git
  glslang
  ninja
  png++
  qt6-tools
  qt6-wayland
  vulkan-headers
  zstd
)
optdepends=('qt6-wayland: Wayland support')
_tag=2abbda924bc7539905a80b044dac812240ef5a70
options=(!lto)
source=(
  git+https://github.com/PCSX2/pcsx2.git#tag=${_tag}
  git+https://github.com/biojppm/c4core.git
  git+https://github.com/fastfloat/fast_float.git
  git+https://github.com/KhronosGroup/glslang.git
  git+https://github.com/rtissera/libchdr.git
  git+https://github.com/biojppm/rapidyaml.git
  git+https://github.com/biojppm/cmake.git
  git+https://github.com/biojppm/debugbreak.git
  git+https://github.com/RetroAchievements/rcheevos.git
  pcsx2-system-libs.patch
  pcsx2-resources-directory.patch
  pcsx2-desktop-file.patch
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '29c8f279f96c67b3a35eb39440c6dfa134ef1cda36026f69f7b9931c59700e61431d7b38002bd811f6e38089296128a16c737e1c0eb2120b342790089c1e4017'
        '51a0feb8e0cc060e8e04c9bda5400b6ab91f043c76c9fde1b26a0f909652f9a0fa57265e02fa24fcc5d18f01a04b8b0781d6640b6be2bbd6ec4cdb568b1230d3'
        '6d5ceb6db92e60c97d8beaf3159305ec1b61b5d0ef8968895235af19db2176699144c6088fbb88e32d3feb35545cf8aa5afb31fdf2e4f1c3746a3c3dd68d2cf6')
install=pcsx2.install

prepare() {
  cd pcsx2
  git apply -3 ../pcsx2-system-libs.patch
  git apply -3 ../pcsx2-resources-directory.patch
  git apply -3 ../pcsx2-desktop-file.patch
  git config --global protocol.file.allow always
  local submodule
  for submodule in 3rdparty/{glslang/glslang,libchdr/libchdr,rapidyaml/rapidyaml,rcheevos/rcheevos}; do
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git submodule update ${submodule}
  done
  cd 3rdparty/rapidyaml/rapidyaml
  for submodule in ext/c4core; do
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git submodule update ${submodule}
  done
  cd ext/c4core
  git submodule init cmake
  git submodule set-url cmake "${srcdir}"/cmake
  git submodule update cmake
  for submodule in src/c4/ext/debugbreak; do
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git submodule update ${submodule}
  done
  for submodule in src/c4/ext/fast_float; do
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git submodule update ${submodule}
  done
}

pkgver() {
  cd pcsx2
  git describe --tags | sed 's/^v//'
}

build() {
  cmake -S pcsx2 -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF \
    -DDISABLE_ADVANCE_SIMD=ON \
    -DDISABLE_BUILD_DATE=ON \
    -DDISABLE_PCSX2_WRAPPER=ON \
    -DDISABLE_SETCAP=ON \
    -DENABLE_TESTS=OFF \
    -DPACKAGE_MODE=ON \
    -DQT_BUILD=ON \
    -DUSE_SYSTEM_LIBS=ON \
    -DUSE_SYSTEM_RYML=OFF \
    -DUSE_VTUNE=OFF \
    -DWAYLAND_API=ON \
    -DX11_API=ON \
    -DXDG_STD=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

# vim: ts=2 sw=2 et:
