# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=redasm-git
pkgver=4.0.0.beta1.r9.gb07f7b3
pkgrel=1
url="https://github.com/redasm-dev"
arch=(x86_64)
pkgdesc="The OpenSource Disassembler"
license=(GPL-3.0-or-later)
depends=(
    glibc
    hicolor-icon-theme
    libgcc
    libstdc++
    qt6-base
    sqlite
    )
makedepends=(
    cmake
    git
    #patchelf
    qt6-tools
    vulkan-headers
    )
conflicts=(redasm)
provides=(redasm)
source=("redasm-workspace::git+https://github.com/redasm-dev/workspace.git")
sha256sums=('SKIP')

prepare() {
  cd redasm-workspace
  cmake -P Setup.cmake
}

pkgver() {
  cd redasm-workspace/redasm
  git describe --long --tags --abbrev=7  --exclude nightly | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(

  )

  cmake -B build -S "redasm-workspace" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
