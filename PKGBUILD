# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>

: ${_use_clang=false}

_pkgname="melonds"
pkgname="$_pkgname-git"
pkgver=1.1.r63.gc851d65
pkgrel=2
pkgdesc='DS emulator, sorta'
url="https://github.com/melonDS-emu/melonDS"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')

depends=(
  'enet'
  'faad2'
  'libarchive'
  'libslirp'
  'qt6-base'
  'qt6-multimedia'
  'qt6-svg'
  'sdl2'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)

if [[ "${_use_clang::1}" == "t" ]]; then
  makedepends+=('clang' 'lld')
fi

provides=('melonds')
conflicts=('melonds')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"

  # allow Arch build system to control build
  sed -e '/CMAKE_INTERPROCEDURAL_OPTIMIZATION/d' -i CMakeLists.txt
  truncate -s 0 cmake/DefaultBuildFlags.cmake
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z]*' \
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
    -S "$_pkgsrc"
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
