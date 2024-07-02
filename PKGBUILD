# Maintainer:
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Ivan Semkin <ivan at semkin dot ru>
# Contributor: Martin Weinelt <hexa at darmstadt dot ccc dot de>

## useful links
# https://matrix.org/
# https://github.com/quotient-im/Quaternion

_pkgname="quaternion"
pkgname="$_pkgname"
pkgver=0.0.96.1
pkgrel=2
pkgdesc='Qt-based IM client for the Matrix protocol'
url="https://github.com/quotient-im/Quaternion"
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')
arch=('aarch64' 'i686' 'x86_64')

depends=(
  libolm
  qt6-declarative
  qt6-multimedia
  qtkeychain-qt6
)
makedepends=(
  clang
  cmake
  git
  qt6-tools
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/quotient-im/Quaternion#tag=$pkgver"

  # submodules for quoternion
  "libquotient"::'git+https://github.com/quotient-im/libQuotient'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

_prepare_submodules_quoternion() (
  cd "$_pkgsrc"
  local _submodules=(
    'libquotient'::'lib'
  )
  _submodule_update
)

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _prepare_submodules_quoternion
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_BUILD_TYPE=Release
    -DUSE_INTREE_LIBQMC=ON
    -DBUILD_WITH_QT6=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=(
    hicolor-icon-theme
  )

  DESTDIR="$pkgdir" cmake --install build
}
