# Maintainer: pruefsumme <194605914+pruefsumme@users.noreply.github.com>
# Copyright (C) 2026 WideMelon contributors
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=widemelon-git
pkgver=1.0.2.r1.g31f5abe
pkgrel=1
pkgdesc='Widescreen Nintendo DS emulator based on melonDS (Git version)'
arch=('x86_64')
url='https://github.com/pruefsumme/widemelon'
license=('GPL-3.0-or-later')
depends=('enet' 'faad2' 'libarchive' 'libpcap' 'libslirp' 'libx11' 'libglvnd'
         'qt6-base' 'qt6-multimedia' 'qt6-svg' 'qt6-websockets' 'sdl2' 'wayland' 'zstd')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja')
provides=('widemelon')
conflicts=('widemelon' 'widemelon-bin')
options=('!debug')
source=('widemelon::git+https://github.com/pruefsumme/widemelon.git')
sha256sums=('SKIP')

pkgver() {
  cd widemelon
  local tag revisions
  tag=$(git tag --list --sort=-v:refname | sed -nE '/^v[0-9]+\.[0-9]+\.[0-9]+$/{p;q;}')
  [[ -n "$tag" ]]
  revisions=$(git rev-list --count "${tag}..HEAD")
  printf '%s.r%s.g%s' "${tag#v}" "$revisions" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -S widemelon -B build -G Ninja \
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
  cmake -S widemelon/tests -B build-tests -G Ninja \
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
