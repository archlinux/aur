# Maintainer: Sándor Nagy <sanya868 at gmail dot com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: mosra <mosra@centrum.cz>

_pkgname="libkomparediff2"
pkgname="$_pkgname-git"
pkgver=23.08.3.r15.g9897e39
pkgrel=1
pkgdesc="Library to compare files and strings. (GIT version)"
url='https://invent.kde.org/sdk/libkomparediff2'
license=('GPL' 'LGPL' 'FDL')
arch=('i686' 'x86_64')

depends=(
  'kio5'
)
makedepends=(
  'extra-cmake-modules'
  'kdoctools5'
  'git'
  'cmake'
)

conflicts=("$_pkgname=${pkgver%%.r*}")
provides=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha1sums=('SKIP')

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

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
