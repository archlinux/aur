# Maintainer:
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_pkgname="filelight"
pkgname="$_pkgname-git"
pkgver=23.08.1.r6.g61a9590
pkgrel=1
pkgdesc="View disk usage information"
arch=('i686' 'x86_64')
url='https://invent.kde.org/utilities/filelight'
license=('GPL' 'LGPL' 'FDL')

depends=(
  'hicolor-icon-theme'
  'kdeclarative'
  'kio'
  'kirigami-addons'
  'kquickcharts'
  'qqc2-desktop-style'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'kdoctools'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"

  local _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)".*>$'
  local _file='misc/org.kde.filelight.appdata.xml'

  local _line=$(
    grep -E "$_regex" "$_file" | head -1
  )
  local _version=$(
    printf '%s' "$_line" | sed -E "s@$_regex@\1@"
  )
  local _commit=$(
    git log -G "$_line" -1 --pretty=oneline --no-color -- "$_file" \
      | sed 's@\ .*$@@'
  )
  local _revision=$(
    git rev-list --count $_commit..HEAD
  )
  local _hash=$(
    git rev-parse --short HEAD
  )

  printf '%s.r%s.g%s' \
    "$_version" \
    "$_revision" \
    "$_hash"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DKDE_INSTALL_LIBDIR='lib'
    -DBUILD_TESTING=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
