# Maintainer: loathingkernel <username at gmail dot com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on the rbdoom3-bfg-git package by M0Rf30

pkgname=rbdoom-3-bfg
_srctag=1.4.0
pkgver=${_srctag//-/.}
pkgrel=1
pkgdesc="Doom 3 BFG Edition with modern engine features like PBR, Baked Global Illumination, Soft Shadows"
arch=('x86_64')
url="https://github.com/RobertBeckebans/RBDOOM-3-BFG"
license=('GPL3')
depends=(
  ffmpeg
  openal
  sdl2
)
makedepends=(
  git
  cmake
  glu
#  vulkan-headers
)
optdepends=(
  'doom3bfg-data: packaged game data files'
)
install=$pkgname.install
options=(!lto)
source=(
  git+https://github.com/RobertBeckebans/RBDOOM-3-BFG.git#tag=v${_srctag}
  glslang::git+https://github.com/KhronosGroup/glslang.git
  rbdoom-3-bfg.desktop
  rbdoom-3-bfg.png
  rbdoom-3-bfg-launcher
)
sha256sums=('SKIP'
            'SKIP'
            '414085bd095261665a5cbf6f575b101ae32f24f9e2b00d4ce7eeaa2cd9a6de72'
            '0fb6a3bb9b47cad65d5012ba20dc9de3b1487f4ac1908ee847e6087511b7f09e'
            'f2690f82beedee7f1f4c981851437e6e0141482a694b44828dd04d372eb934e9')

prepare() {
  cd RBDOOM-3-BFG
  for submodule in neo/extern/glslang; do
    git submodule init "${submodule}"
    git config submodule."${submodule}".url ../"${submodule##*/}"
    git submodule update "${submodule}"
  done
}

build() {
  cd RBDOOM-3-BFG
  cmake \
    -S neo \
    -B build \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_VULKAN=OFF \
    -DUSE_SYSTEM_LIBGLEW=OFF \
    -DUSE_SYSTEM_LIBJPEG=OFF \
    -DUSE_SYSTEM_LIBPNG=OFF \
    -DUSE_SYSTEM_RAPIDJSON=OFF \
    -DUSE_SYSTEM_ZLIB=OFF \
    -DUSE_PRECOMPILED_HEADERS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  install -Dm755 -t "$pkgdir"/usr/bin/ RBDOOM-3-BFG/build/RBDoom3BFG
  install -Dm755 -t "$pkgdir"/usr/bin/ rbdoom-3-bfg-launcher
  install -Dm644 -t "$pkgdir"/usr/share/applications/ rbdoom-3-bfg.desktop
  install -Dm644 -t "$pkgdir"/usr/share/pixmaps/ rbdoom-3-bfg.png
}

