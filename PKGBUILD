# Maintainer:

_pkgname="disman"
pkgname="$_pkgname"
pkgver=0.600.0
pkgrel=2
pkgdesc='Qt/C++ display management library (kwinft)'
url="https://github.com/winft/disman"
license=('LGPL-2.1-only')
arch=('x86_64' 'aarch64')

depends=(
  kcoreaddons
  kwayland
  qt6-base

  # AUR
  wrapland
)
makedepends=(
  clang
  extra-cmake-modules
  git
  lld
  llvm
  microsoft-gsl
  ninja
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('bf584ab99b585f4d88a6e0310b71d5aab500361ae8369acab0d2a0cd1abe784c')

prepare() {
  sed -E \
    -e 's&^(find_package\(KF6)&find_package(KWayland)\n\1&' \
    -e 's&TYPE OPTIONAL&TYPE REQUIRED&' \
    -e '/^\s*Wayland$/d' \
    -e 's&KF6Wayland&KWayland&' \
    -i "$_pkgsrc/CMakeLists.txt"

  cat -n "$_pkgsrc/CMakeLists.txt"
}

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
