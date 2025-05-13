# Maintainer: loathingkernel <username at gmail dot com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on the rbdoom3-bfg-git package by M0Rf30

pkgname=rbdoom-3-bfg
_srctag=1.6.0
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
  clang
  cmake
  directx-shader-compiler
  git
  glu
  ispc
  ninja
  vulkan-headers
)
optdepends=(
  'doom3bfg-data: packaged game data files'
  'pyside6: for the included launcher script'
  'python-pyxdg: for the included launcher script'
  'mergerfs: required by the included launcher script to setup the correct file structure'
)
install=$pkgname.install
options=(!lto)
source=(
  git+https://github.com/RobertBeckebans/RBDOOM-3-BFG.git#tag=v${_srctag}
  rbdoom-3-bfg.png
  rbdoom-3-bfg.desktop
  rbdoom-3-bfg-launcher
  rbdoom-3-bfg-launcher.desktop
)

prepare() {
  cd RBDOOM-3-BFG
  git remote set-url origin https://github.com/RobertBeckebans/RBDOOM-3-BFG.git
  git submodule update --init --filter=tree:0 --recursive
}

build() {
  export CC=clang
  export CXX=clang++
  cmake \
    -S RBDOOM-3-BFG/neo \
    -B build \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBINKDEC=OFF \
    -DFFMPEG=ON \
    -DWINDOWS10=OFF \
    -DUSE_DX12=OFF \
    -DUSE_VULKAN=ON \
    -DUSE_SYSTEM_RAPIDJSON=OFF \
    -DUSE_SYSTEM_ZLIB=OFF \
    -DUSE_PRECOMPILED_HEADERS=OFF \
    -GNinja \
    -Wno-dev
  cmake --build build --verbose
}

package() {
  install -dm755 "$pkgdir"/usr/share/games/doom3bfg
  cp -r RBDOOM-3-BFG/base "$pkgdir"/usr/share/games/doom3bfg/
  install -Dm755 -t "$pkgdir"/usr/bin/ build/RBDoom3BFG
  install -Dm755 -t "$pkgdir"/usr/bin/ rbdoom-3-bfg-launcher
  install -Dm644 -t "$pkgdir"/usr/share/applications/ rbdoom-3-bfg.desktop
  install -Dm644 -t "$pkgdir"/usr/share/applications/ rbdoom-3-bfg-launcher.desktop
  install -Dm644 -t "$pkgdir"/usr/share/pixmaps/ rbdoom-3-bfg.png
}

sha256sums=('7360cae94ee9a09817e552a1c2b18f31b8c41f2f9f1147266b7980774d409b55'
            '0fb6a3bb9b47cad65d5012ba20dc9de3b1487f4ac1908ee847e6087511b7f09e'
            'f317d503d30ecc6e0a70e353cb020d2ea78ecb05d8d2e0250f39cfd8a4fe16a5'
            'a3c3006c254ce25ff890494acc8cfbfb88d406661f4468b56aaefc144227db21'
            'c083d028b5dd6f7c0d13d8d3f7a4b73a0d57d414890fea454eecbbf2dbcdac6d')
