# Maintainer:
# Contributor: morguldir <morguldir@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Martin Weinelt <hexa@darmstadt.ccc.de>

## useful links
# https://matrix.org/
# https://github.com/quotient-im/Quaternion

_pkgname="quaternion"
pkgname="$_pkgname-git"
pkgver=0.0.96.1.r6.g85997fb
pkgrel=1
pkgdesc='Qt-based IM client for the Matrix protocol'
url="https://github.com/quotient-im/Quaternion"
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')
arch=('aarch64' 'i686' 'x86_64')

depends=(
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

provides=("$_pkgname=${pkgver%.r**}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/quotient-im/Quaternion"

  # submodules for quoternion
  "libquotient"::'git+https://github.com/quotient-im/libQuotient'

  # submodules for libquotient
  'gtad'::'git+https://github.com/quotient-im/gtad.git'
  'doxygen-awesome-css'::'git+https://github.com/jothepro/doxygen-awesome-css.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude '[a-z]*' --exclude '*[a-z][a-z]*' \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_prepare_submodules_quoternion() (
  cd "$_pkgsrc"
  local _submodules=(
    'libquotient'::'lib'
  )
  _submodule_update
)

_prepare_submodules_libquotient() (
  cd "$_pkgsrc/lib"
  local _submodules=(
    'doxygen-awesome-css'::'doxygen-awesome-css'
    'gtad'::'gtad/gtad'
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
  _prepare_submodules_libquotient
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
