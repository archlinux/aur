# Maintainer:
# Contributor: morguldir <morguldir@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Martin Weinelt <hexa@darmstadt.ccc.de>

## useful links
# https://matrix.org/
# https://github.com/quotient-im/Quaternion

## options
: ${_build_clang:=true}

: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="quaternion"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.0.96.r1.gdc0381e3
pkgrel=1
pkgdesc='Qt-based IM client for the Matrix protocol'
url="https://github.com/quotient-im/Quaternion"
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')
arch=('aarch64' 'i686' 'x86_64')

## main package
_main_package() {
  depends=(
    libolm.so
    qt6-5compat
    qt6-multimedia
    qt6-declarative
    qtkeychain-qt6
  )
  makedepends=(
    cmake
    git
    qt6-tools
  )

  if [[ "${_build_clang::1}" == "t" ]] ; then
    makedepends+=(
      clang
      lld
    )
  fi

  if [ "${_build_git::1}" != "t" ] ; then
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

  _prepare_package() {
    _prepare_submodules_quoternion
  }

  pkgver() {
    echo "${pkgver%%.r*}"
  }
}

## git package
_main_git() {
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
    git describe --long --tags --abbrev=8 --exclude '[a-z]*' --exclude '*[a-z][a-z]*' \
      | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  }

  _prepare_package() {
    _prepare_submodules_quoternion
    _prepare_submodules_libquotient
  }
}

## submodules
_prepare_submodules_quoternion() (
    cd "$_pkgsrc"
    local -A _submodules=(
      ['libquotient']='lib'
    )
    _submodule_update
)

_prepare_submodules_libquotient() (
    cd "$_pkgsrc/lib"
    local -A _submodules=(
      ['doxygen-awesome-css']='doxygen-awesome-css'
      ['gtad']='gtad/gtad'
    )
    _submodule_update
)

## common functions
prepare() {
  _submodule_update() {
    local key
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  _prepare_package
}

build() {
  if [[ "${_build_clang::1}" == "t" ]] ; then
    export CXX=clang++
    export LDFLAGS+=" -fuse-ld=lld"
  fi

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

## execute
_main_package
