# Maintainer:
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_pkgname="plasmatube"
pkgname="$_pkgname-git"
pkgver=24.12.2.r8.geb3e9bb
pkgrel=1
pkgdesc="YouTube video player based on mpv, yt-dlp, and Invidious"
url="https://invent.kde.org/multimedia/plasmatube"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'kconfig'
  'kcoreaddons'
  'kdbusaddons'
  'ki18n'
  'kirigami-addons'
  'kwindowsystem'
  'mpvqt'
  'purpose'
  'qtkeychain-qt6'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _regex _file _line _version _commit _revision _hash
  _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)".*>$'
  _file='org.kde.plasmatube.appdata.xml'
  _line=$(grep -E "$_regex" "$_file" | head -1)
  _version=$(printf '%s' "$_line" | sed -E "s@$_regex@\1@")
  _commit=$(
    git log -G "$_line" -1 --pretty=oneline --no-color -- $_file \
      | sed 's@\ .*$@@'
  )
  _revision=$(git rev-list --count --cherry-pick "$_commit"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "$_version" "$_revision" "$_hash"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
