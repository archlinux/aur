# Maintainer: futpib

_pkgname="kmux"
pkgname="$_pkgname-git"
pkgver=26.08.0.r278.g674abd5
pkgrel=1
pkgdesc='tmux client based on Konsole'
url="https://github.com/futpib/$_pkgname"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
arch=('x86_64')

depends=(
  'glibc'
  'hicolor-icon-theme'
  'icu'
  'kbookmarks'
  'kcolorscheme'
  'kconfig'
  'kconfigwidgets'
  'kcoreaddons'
  'kcrash'
  'kdbusaddons'
  'kglobalaccel'
  'kguiaddons'
  'ki18n'
  'kiconthemes'
  'kio'
  'knewstuff'
  'knotifications'
  'knotifyconfig'
  'kparts'
  'kpty'
  'kservice'
  'ktextwidgets'
  'kwidgetsaddons'
  'kwindowsystem'
  'kxmlgui'
  'libssh'
  'libstdc++'
  'libxkbcommon'
  'qt6-base'
  'qt6-multimedia'
  'sh'
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
    printf 'Could not find the commit that introduced %s\n' "$_line" >&2
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
