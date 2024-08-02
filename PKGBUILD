# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>

pkgname=melonds-git
_gitname=melonDS
pkgver=0.9.5.r2388.76c2723f
pkgrel=1
pkgdesc='DS emulator, sorta'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://melonds.kuribo64.net/"
license=('GPL-3.0-or-later')
depends=('libepoxy' 'qt6-base' 'qt6-multimedia' 'sdl2')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'ninja' 'pkg-config')
provides=('melonds')
conflicts=('melonds')

source=("${_gitname}::git+https://github.com/melonDS-emu/melonDS.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_gitname"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DUSE_QT6=ON
    -DUSE_SYSTEM_LIBSLIRP=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim: ts=2 sw=2 et:
