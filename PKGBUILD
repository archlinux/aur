# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

# options
#: ${_pkgtype:=git}

# basic info
_pkgname="heimer"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=4.3.0
pkgrel=1
pkgdesc="Cross-platform mind map, diagram, and note-taking tool written in Qt"
url='https://github.com/juzzlin/heimer'
license=('GPL3')
arch=("x86_64")

# main package
_main_package() {
  depends=(
    'hicolor-icon-theme'
    'qt5-svg'
  )
  makedepends=(
    'cmake'
    'qt5-tools'
  )

  if [ "$pkgname" == "$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _pkgsrc="Heimer-${pkgver%%.r*}"
  _pkgext="tar.gz"
  source=("$pkgname-${pkgver%%.r*}.$_pkgext"::"$url/archive/${pkgver%%.r*}.tar.gz")
  sha256sums=('6431955e85a10cde22399247d57c937db51afd84677dab200093992f00353436')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
}

# git package
_main_git() {
  makedepends+=('git')

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

# common functions
build() {
  local _cmake_options=(
    -S "$_pkgsrc"
    -B build
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build

  install -Dvm644 "${srcdir:?}/$_pkgsrc/COPYING" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}

# execute
_main_package
