# Maintainer:
# Contributor: Zanny <lordzanny@gmail.com>
# Contributor: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_pkgname="kaccounts-providers"
pkgname="$_pkgname-git"
pkgver=24.08.0.r12.gd81fe4e
pkgrel=1
pkgdesc='Online account providers for the KAccounts system'
url='https://invent.kde.org/network/kaccounts-providers'
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'kaccounts-integration'
  'kpackage'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'intltool'
  'ninja'
  'qcoro-qt6'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

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
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
