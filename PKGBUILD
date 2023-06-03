# Maintainer:
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_pkgname="plasmatube"
pkgname="$_pkgname-git"
pkgver=23.04.2.r0.g8fcdc91
pkgrel=1
pkgdesc="Kirigami YouTube video player based on libmpv and youtube-dl"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/multimedia/plasmatube"
license=(GPL3)

depends=(
  'kirigami-addons'
  'qt5-svg'
  'kcoreaddons'
  'kconfig'
  'ki18n'
  'mpv'
  'yt-dlp'
)
makedepends=(
  'extra-cmake-modules'
  'git'
)

provides=("$_pkgname")
conflicts=(${provides[@]})

source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"

  _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)".*>$'

  _version=$(
    grep -E "$_regex" org.kde.plasmatube.appdata.xml \
      | sed -E "s@$_regex@\1@" \
      | head -1
  )
  _commit=$(
    git log -S "$_version" -1 --pretty=oneline --no-color | sed 's@\ .*$@@'
  )
  _revision=$(
    git rev-list --count $_commit..HEAD
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  echo "$_version.r$_revision.g$_hash"
}

build() {
  cmake -B build -S "$_pkgname" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD_TESTING=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
