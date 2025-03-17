# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

_pkgname="heimer"
pkgname="$_pkgname"
pkgver=4.5.0
pkgrel=2
pkgdesc="Cross-platform mind map, diagram, and note-taking tool"
url='https://github.com/juzzlin/heimer'
license=('GPL-3.0-or-later')
arch=("x86_64")

depends=(
  'hicolor-icon-theme'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'ninja'
  'qt6-tools'
)

_pkgsrc="Heimer-$pkgver"
_pkgext="tar.gz"
source=("$pkgname-$pkgver.$_pkgext"::"$url/archive/$pkgver.$_pkgext")
sha256sums=('92bedc9a42eb80d872f4700ee5ee3bfa3884762831d0a11b735c6f72452a4726')

build() (
  export PATH="/usr/lib/qt6/bin:$PATH"

  local _cmake_options=(
    -S "$_pkgsrc"
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_WITH_QT6=YES
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
