# Maintainer:
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_pkgname="filelight"
pkgname="$_pkgname-git"
pkgver=25.08.3.r67.g44c03e5
pkgrel=1
pkgdesc="View disk usage information"
url='https://invent.kde.org/utilities/filelight'
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'hicolor-icon-theme'
  'kdeclarative'
  'kio'
  'kirigami-addons'
  'kquickcharts'
  'kxmlgui'
  'qqc2-desktop-style'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'kdoctools'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  local _tag=$(git tag | grep -Ev '\.[0-9]{2}$' | sort -rV | head -1)
  local _version="${_tag#v}"
  local _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DKDE_INSTALL_LIBDIR='lib'
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
