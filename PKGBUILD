# Maintainer:
# Contributor: Daniel Landau <aur@landau.fi>

_pkgname="qcsxcad"
pkgname="$_pkgname"
pkgver=0.6.3
pkgrel=4
pkgdesc="Qt-GUI for CSXCAD"
url="https://github.com/thliebig/QCSXCAD"
license=("LGPL-3.0-or-later")
arch=("x86_64")

depends=(
  'csxcad' # AUR
  'qt6-5compat'
  'qt6-base'
  'vtk'
)
makedepends=(
  'cmake'
  'ninja'

  'fast_float'
  'nlohmann-json'
)

_pkgsrc="QCSXCAD-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"$url/archive/v$pkgver.$_pkgext"
  '0001_disable_property_editor.patch'
)
sha256sums=(
  'f05edbcca65f0bf8a3fb6ab20baa3db0b8651c2baab2f6a3f0113436c866f879'
  '6fde23f71472296942bb99e2344c1a914f4e3049d7962328a923cf659f67c410'
)

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -d "$_pkgsrc" -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done

  # fix cmake
  sed -E -e '/cmake_policy/d' \
    -e '/PROJECT/s&(CXX)&\1 C&' \
    -i "$_pkgsrc/CMakeLists.txt"

  # fix namespace
  install -D /dev/stdin hammer.h << END
#include <iostream>
using std::cerr;
using std::cout;
END
}

build() {
  export CXXFLAGS+=" -include '$srcdir/hammer.h'"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-author
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
