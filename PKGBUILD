# Maintainer:
# Contributor: Daniel Landau <aur@landau.fi>

_pkgname="qcsxcad"
pkgname="$_pkgname"
pkgver=0.7.0
pkgrel=1
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
  '0001-fix-missing-GetPolyDataModel.patch'
)
sha256sums=(
  'a266a094ef23a6e63d8c60dee90aaab52623c9438ee07fcad80232271984c06d'
  'f9898121a90f31af434c1d45f9af76b3c021eb10086bf5379dbb9c3963944bc1'
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
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-author
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
