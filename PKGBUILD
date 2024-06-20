# Maintainer:

_pkgname="wrapland"
pkgname="$_pkgname"
pkgver=0.601.0
pkgrel=1
pkgdesc='Qt/C++ library wrapping libwayland (kwinft)'
url="https://github.com/winft/wrapland"
license=('LGPL-2.1-only')
arch=('x86_64' 'aarch64')

depends=(
  libglvnd
  qt6-base
  wayland
)
makedepends=(
  clang
  doxygen
  extra-cmake-modules
  git
  lld
  llvm
  microsoft-gsl
  ninja
  wayland-protocols
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext"
)
sha256sums=('46b39f09c3fb8f3effb21955d75f26ea6f79d50f516f7116453c3bc4a3a5eb8b')

build() {
  export CC=clang
  export CXX=clang++
  export LDFLAGS+=" -fuse-ld=lld"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
