# Maintainer:
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Ivan Semkin <ivan at semkin dot ru>

## links
# https://matrix.org/
# https://github.com/quotient-im/Quaternion

## options
: ${_commit:=b8ccb715ecbc8214bc2d13ee794f8722327984dc} # 0.0.96.1

_pkgname="quaternion"
pkgname="$_pkgname"
pkgver=0.0.96.1
pkgrel=3
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
  ninja
  qt6-tools
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git#commit=$_commit"

  # submodules for quaternion
  "libquotient"::'git+https://github.com/quotient-im/libQuotient'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

_prepare_quaternion() (
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

  _prepare_quaternion
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_WITH_QT6=ON
    -DUSE_INTREE_LIBQMC=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
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
