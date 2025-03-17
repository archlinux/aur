# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

_pkgname="heimer"
pkgname="$_pkgname-git"
pkgver=4.5.0.r0.gd3153c5
pkgrel=1
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
  'git'
  'ninja'
  'qt6-tools'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source+=("$_pkgsrc"::"git+$url.git")
sha256sums+=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

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
