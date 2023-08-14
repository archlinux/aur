# Maintainer:
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_pkgname="filelight"
pkgname="$_pkgname-git"
pkgver=23.04.3.r23.g796dbcb
pkgrel=1
pkgdesc="View disk usage information"
arch=('i686' 'x86_64')
url='https://invent.kde.org/utilities/filelight'
license=('GPL' 'LGPL' 'FDL')

depends=(
  'hicolor-icon-theme'
  'kdeclarative'
  'kio'
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

source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"

  _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)".*>$'
  _file='misc/org.kde.filelight.appdata.xml'

  _line=$(
    grep -E "$_regex" "$_file" | head -1
  )
  _version=$(
    echo "$_line" | sed -E "s@$_regex@\1@"
  )
  _commit=$(
    git log -G "$_line" -1 --pretty=oneline --no-color | sed 's@\ .*$@@'
  )
  _revision=$(
    git rev-list --count $_commit..HEAD
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  printf '%s.r%s.g%s' \
    "$_version" \
    "$_revision" \
    "$_hash"
}

build() {
  _cmake_options=(
    -B build
    -S "$_pkgname"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DKDE_INSTALL_LIBDIR=lib
    -DBUILD_TESTING=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
