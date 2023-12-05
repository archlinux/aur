# Maintainer:
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

# options
: ${_pkgtype:=git}

# basic info
_pkgname="konsole"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=23.08.4.r8.gaed2dd76d
pkgrel=1
pkgdesc='KDE terminal emulator'
url="https://invent.kde.org/utilities/konsole"
license=(GPL LGPL FDL)
arch=(x86_64)

depends=(
  'knewstuff'
  'knotifyconfig'
  'kparts'
  'kpty'
  'ktextwidgets'
  'qt6-multimedia'
)
makedepends=(
  'extra-cmake-modules>=5.240.0'
  'git'
  'kdoctools'
)
optdepends=(
  'keditbookmarks: to manage bookmarks'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)"\s.*/>$'
  _file='desktop/org.kde.konsole.appdata.xml'

  _line=$(grep -E "$_regex" "$_file" | head -1)
  _version=$(
    printf '%s\n' "$_line" \
      | sed -E "s@$_regex@\1@"
  )
  _commit=$(
    git log -G "$_line" -1 --pretty=oneline --no-color -- $_file \
      | sed 's@\ .*$@@'
  )
  _revision=$(git rev-list --count $_commit..HEAD)
  _hash=$(git rev-parse --short HEAD)

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
    -DCMAKE_INSTALL_LIBDIR='lib'

    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
