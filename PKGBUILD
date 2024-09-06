# Maintainer:
# Contributor: Sándor Nagy <sanya868 at gmail dot com>

_pkgname="libkomparediff2"
pkgname="$_pkgname-git"
pkgver=24.08.0.r7.g62d8f88
pkgrel=1
pkgdesc="Library to compare files and strings"
url='https://invent.kde.org/sdk/libkomparediff2'
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
arch=('x86_64')

depends=(
  'kio'
  'kxmlgui'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'kdoctools'
  'ninja'
)

conflicts=("$_pkgname=${pkgver%%.r*}")
provides=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#branch=${_branch:-master}")
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag | grep -Ev '\.[0-9][0-9]$' | sort -rV | head -1)
  local _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_tag#v}" "$_revision" "$_hash"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    -DBUILD_WITH_QT6=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
