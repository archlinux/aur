# Maintainer:
# Contributor: morguldir <morguldir@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Martin Weinelt <hexa@darmstadt.ccc.de>

## useful links
# https://matrix.org/
# https://github.com/quotient-im/Quaternion

## options
: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="quaternion"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.0.95.1.r238.gc074213
pkgrel=1
pkgdesc='Qt-based IM client for the Matrix protocol'
url="https://github.com/quotient-im/Quaternion"
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')
arch=('aarch64' 'i686' 'x86_64')

## main package
_main_package() {
  depends=(
    hicolor-icon-theme
    qt5-multimedia
    qt5-quickcontrols2
    qt5-tools
    qtkeychain-qt5
  )
  makedepends=(
    cmake
    git
  )
  optdepends=(
    'qt5-graphicaleffects: Display the conversation history at startup'
  )

  if [ "$pkgname" == "$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi

}

## stable package
_main_stable() {
  _pkgsrc="$_pkgname"
  source=(
    "$_pkgsrc"::"git+https://github.com/quotient-im/Quaternion#tag=${pkgver%%.r*}"

    # submodules for quoternion
    "libquotient"::'git+https://github.com/quotient-im/libQuotient'
  )
  sha256sums=(
    'SKIP'

    'SKIP'
  )

  prepare() {
    _prepare_submodules_quoternion
  }

  pkgver() {
    echo "${pkgver%%.r*}"
  }
}

## git package
_main_git() {
  provides=("$_pkgname")
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
    git describe --long --tags --exclude '[a-z]*' --exclude '*[a-z][a-z]*' \
      | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  }

  prepare() {
    _prepare_submodules_quoternion
    _prepare_submodules_libquotient
  }
}

## submodules
_prepare_submodules_quoternion() {
  (
    # submodules for quaternion
    cd "$_pkgsrc"
    local -A _submodules=(
      ['libquotient']='lib'
    )
     for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  )
}

_prepare_submodules_libquotient() {
  (
    # submodules for libquotient
    cd "$_pkgsrc/lib"
    local -A _submodules=(
      ['doxygen-awesome-css']='doxygen-awesome-css'
      ['gtad']='gtad/gtad'
    )
     for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  )
}

## common functions
build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_BUILD_TYPE=Release
    -DUSE_INTREE_LIBQMC=ON
    -DBUILD_WITH_QT6=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}

## execute
_main_package
