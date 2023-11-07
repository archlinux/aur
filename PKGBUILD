# Maintainer:
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname="spectacle"
pkgname="$_pkgname-git"
pkgver=23.08.1.r58.gdd8b0fc9
pkgrel=1
pkgdesc='KDE screenshot capture utility'
url='https://invent.kde.org/graphics/spectacle'
license=(GPL)
arch=(x86_64)

depends=(
  'knewstuff5'
  'kpipewire'
  'purpose5'
  'qt5-tools'
  'xcb-util-cursor'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'kdoctools5'
  'plasma-wayland-protocols'
)

_pkgsrc="$_pkgname"
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_commit=dd8b0fc9 
source=("git+https://invent.kde.org/graphics/spectacle.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  local _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)".*>$'
  local _file='desktop/org.kde.spectacle.appdata.xml'

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
    -B "build"
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install "build"
}

