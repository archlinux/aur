# Maintainer:
# Contributor: éclairevoyant

_pkgname="s2geometry"
pkgname="$_pkgname"
pkgver=0.12.0
pkgrel=1
pkgdesc="A library for manipulating geometric shapes"
url="https://github.com/google/s2geometry"
license=('Apache-2.0')
arch=("x86_64" "aarch64")

depends=(
  'abseil-cpp'
  'openssl'
)
makedepends=(
  'cmake'
  'python'
  'ninja'
)

provides=('libs2.so')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext"
  "nullability_deprecated-9d51fa7.h"::"https://github.com/abseil/abseil-cpp/raw/9d51fa78353589138570e03a89601da24ebbc099/absl/base/internal/nullability_deprecated.h"
)
sha256sums=(
  'c09ec751c3043965a0d441e046a73c456c995e6063439a72290f661c1054d611'
  'c8d3f503d09425ef1d5cc2fe1d69633ce36c31921705dbd71bb07497960d59b0'
)

prepare() {
  # https://github.com/abseil/abseil-cpp/commit/e4c43850ad008b362b53622cb3c88fd915d8f714
  cp "nullability_deprecated-9d51fa7.h" "$_pkgsrc/src/s2/nullability_deprecated.h"
  sed '1i #include "nullability_deprecated.h"' -i \
    "$_pkgsrc/src/s2/s2density_tree.h" \
    "$_pkgsrc/src/s2/s2edge_tessellator.h"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DBUILD_TESTS=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
