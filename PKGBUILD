# Maintainer:
# Contributor: morguldir <morguldir@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Martin Weinelt <hexa@darmstadt.ccc.de>

## links
# https://matrix.org/
# https://github.com/quotient-im/Quaternion

_pkgname="quaternion"
pkgname="$_pkgname-git"
pkgver=0.0.96.1.r35.g54fc44d
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
  ninja
  qt6-tools
)

provides=("$_pkgname=${pkgver%.r**}")
conflicts=("$_pkgname")

options=('!emptydirs')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"

  # submodules for quaternion
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

_prepare_quaternion() (
  cd "$_pkgsrc"
  local _submodules=(
    'libquotient'::'lib'
  )
  _submodule_update
)

_prepare_libquotient() (
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

  _prepare_quaternion
  _prepare_libquotient
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

  # conflicts with extra/libquotient
  rm "$pkgdir/usr/lib/libQuotientQt6.a"
  rm "$pkgdir/usr/lib/pkgconfig/QuotientQt6.pc"
  rm "$pkgdir/usr/share/ndk-modules/Android.mk"
  rm -rf "$pkgdir/usr/include/Quotient"
  rm -rf "$pkgdir/usr/lib/cmake/QuotientQt6"
}
