# Maintainer: pruefsumme <194605914+pruefsumme@users.noreply.github.com>
# Copyright (C) 2026 WideMelon contributors
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=widemelon
pkgver=1.0.4
pkgrel=1
pkgdesc='Widescreen Nintendo DS emulator based on melonDS'
arch=('x86_64')
url='https://github.com/pruefsumme/widemelon'
license=('GPL-3.0-or-later')
depends=('enet' 'faad2' 'libarchive' 'libpcap' 'libslirp' 'libx11' 'libglvnd'
         'qt6-base' 'qt6-multimedia' 'qt6-svg' 'qt6-websockets' 'sdl2' 'wayland' 'zstd')
makedepends=('cmake' 'extra-cmake-modules' 'ninja')
conflicts=('widemelon-git' 'widemelon-bin')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pruefsumme/widemelon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('33ca3c37bee6430222cf3af8cee075e9288c804938ed95909d7bb06c80328cbb')

build() {
  cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS" \
    -DENABLE_LTO_RELEASE=OFF \
    -DUSE_SYSTEM_LIBSLIRP=ON \
    -DUSE_QT6=ON
  cmake --build build
}

check() {
  cmake -S "${pkgname}-${pkgver}/tests" -B build-tests -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -DUSE_QT6=ON
  cmake --build build-tests
  ctest --test-dir build-tests --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
