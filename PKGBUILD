# Maintainer: Sándor Nagy <sanya868 at gmail dot com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname="kompare"
pkgname="$_pkgname-git"
pkgver=23.08.3.r41.gac940ef
pkgrel=1
pkgdesc="Graphical file differences tool"
url="https://invent.kde.org/sdk/kompare"
license=('GPL' 'LGPL' 'FDL')
arch=('x86_64')

depends=(
  'hicolor-icon-theme'
  'ktexteditor5'
  'libkomparediff2'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'kdoctools5'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  local _tag=$(git tag | grep -Ev '\.[0-9][0-9]$' | sort -V | tail -1)
  local _revision=$(git rev-list --count $_tag..HEAD)
  local _hash=$(git rev-parse --short HEAD)

  printf '%s.r%s.g%s' \
    "${_tag#v}" \
    "$_revision" \
    "$_hash"
}

_prepare() {
  mkdir -p build

  #sed 's|${DATA_INSTALL_DIR}|${KXMLGUI_INSTALL_DIR}|g' -i kompare{,/komparepart}/CMakeLists.txt
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
