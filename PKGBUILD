# Maintainer: futpib

_pkgname="kmux"
pkgname="$_pkgname-git"
pkgver=26.04.3.r286.g0ff2883
pkgrel=1
pkgdesc='tmux client based on Konsole'
url="https://github.com/futpib/$_pkgname"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
arch=('x86_64')

depends=(
  'knewstuff'
  'knotifyconfig'
  'kparts'
  'kpty'
  'ktextwidgets'
  'qt6-multimedia'
  'tmux'
)
makedepends=(
  'extra-cmake-modules>=5.240.0'
  'git'
  'kdoctools'
  'ninja'
)
optdepends=(
  'keditbookmarks: to manage bookmarks'
)

options=('!lto')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)"\s.*/>$'
  _file='desktop/org.kde.kmux.appdata.xml'
  _history_path=':(glob)desktop/*.appdata.xml'

  _line=$(grep -E "$_regex" "$_file" | head -1)
  _version=$(
    printf '%s\n' "$_line" \
      | sed -E "s@$_regex@\1@"
  )
  _commit=$(
    git log -G "$_line" -1 --format='%H' -- "$_history_path"
  )
  if [[ -z "$_commit" ]]; then
    error "Could not find the commit that introduced $_line"
    return 1
  fi
  _revision=$(git rev-list --count "$_commit"..HEAD)
  _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' \
    "$_version" \
    "$_revision" \
    "$_hash"
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
