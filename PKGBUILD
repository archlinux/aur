# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

_pkgname="heimer"
pkgname="$_pkgname"
pkgver=4.2.0
pkgrel=1
pkgdesc="Cross-platform mind map, diagram, and note-taking tool written in Qt"
url='https://github.com/juzzlin/heimer'
license=('GPL3')
arch=("x86_64")

depends=(
  'hicolor-icon-theme'
  'qt5-svg'
 )
makedepends=(
  'cmake'
  'qt5-tools'
 )


if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="Heimer-${pkgver%%.r*}"
  _pkgext="tar.gz"
  source=("$pkgname-${pkgver%%.r*}.$_pkgext"::"$url/archive/${pkgver%%.r*}.tar.gz")
  sha256sums=('cbbc68c556845cb66a0bba0f1eab0bd6a0fb0d7f8bdd7e23984a45ab55b25ff5')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
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
fi

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
