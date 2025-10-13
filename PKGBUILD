# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>

## links
# http://melonds.kuribo64.net/
# https://github.com/melonDS-emu/melonDS

: ${_use_clang=true}

pkgname=melonds-git
_gitname=melonDS
pkgver=1.0.r35.g91ab680
pkgrel=1
pkgdesc='DS emulator, sorta'
url="https://github.com/melonDS-emu/melonDS"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')

depends=('enet' 'faad2' 'libarchive' 'libslirp' 'qt6-base' 'qt6-multimedia' 'qt6-svg' 'sdl2')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja' 'pkg-config')

if [[ "${_use_clang::1}" == "t" ]]; then
  makedepends+=('clang' 'lld')
else
  options=('!lto')
fi

provides=('melonds')
conflicts=('melonds')

source=("${_gitname}::git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "${_gitname}"

  # allow Arch build system to control build
  sed -e '/CMAKE_INTERPROCEDURAL_OPTIMIZATION/d' -i CMakeLists.txt
  truncate -s 0 cmake/DefaultBuildFlags.cmake

  # fix for Qt 6.10
  sed -E -e 's&\b(Qt6::)?(Widgets)\b&\1\2 \1GuiPrivate&' -i src/frontend/qt_sdl/CMakeLists.txt
}

pkgver() {
  cd "${_gitname}"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' --exclude='*[a-zA-Z]' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export CC CXX CFLAGS CXXFLAGS LDFLAGS
  CFLAGS+=" -DNDEBUG"
  CXXFLAGS+=" -DNDEBUG"

  if [[ "${_use_clang::1}" == "t" ]]; then
    CC=clang
    CXX=clang++
    LDFLAGS="$(sed -E -e 's/\S*fuse-ld\S*//g' <<< "$LDFLAGS") -fuse-ld=lld"
  fi

  local _cmake_options=(
    -B build
    -S "$_gitname"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev

    -DUSE_QT6=ON
    -DUSE_SYSTEM_LIBSLIRP=ON
    -DMELONDS_VERSION_SUFFIX=".r${pkgver##*.r}"
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim: ts=2 sw=2 et:
