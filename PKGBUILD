# Maintainer:
# Contributor: Sándor Nagy <sanya868 at gmail dot com>

_pkgname="kompare"
pkgname="$_pkgname-git"
pkgver=24.08.0.r16.g11aa247
pkgrel=1
pkgdesc="Graphical file differences tool"
url="https://invent.kde.org/sdk/kompare"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
arch=('x86_64')

depends=(
  'libkomparediff2-git'
  'ktexteditor'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'kdoctools'
  'ninja'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://invent.kde.org/sdk/kompare.git#branch=${_branch:-master}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  local _tag=$(git tag | grep -Ev '\.[0-9][0-9]$' | sort -rV | head -1)
  local _revision=$(git rev-list --cherry-pick --count "$_tag"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_tag#v}" "$_revision" "$_hash"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
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
