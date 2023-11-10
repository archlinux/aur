# Maintainer:
# Contributor: Zanny <lordzanny@gmail.com>
# Contributor: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname="kaccounts-providers"
pkgname="$_pkgname-git"
pkgver=23.08.3.r30.gc1472cd
pkgrel=1
pkgdesc='Online account providers for the KAccounts system'
url='https://invent.kde.org/network/kaccounts-providers'
license=('GPL')
arch=(x86_64)

depends=(
  'kaccounts-integration'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'intltool'
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
