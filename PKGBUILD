# Maintainer: xiota / aur.chaotic.cx
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_pkgname="plasmatube"
pkgname="$_pkgname-git"
pkgver=23.08.1.r17.gcb6b8de
pkgrel=1
pkgdesc="Kirigami YouTube video player based on libmpv and yt-dlp"
url="https://invent.kde.org/multimedia/plasmatube"
license=(GPL3)
arch=(x86_64 i686 arm armv6h armv7h aarch64)

depends=(
  'kconfig5'
  'kcoreaddons5'
  'ki18n5'
  'kirigami-addons5'
  'mpv'
  'qt5-svg'
  'yt-dlp'
)
makedepends=(
  'extra-cmake-modules'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  :
else
  # git package
  makedepends+=('git')

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _commit='cb6b8dea'

  _pkgsrc="$_pkgname"
  source=(
    "$_pkgsrc"::"git+$url.git#commit=$_commit"
  )
  sha256sums=(
    'SKIP'
  )

  pkgver() {
    cd "$srcdir/$_pkgname"

    _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)".*>$'
    _file='org.kde.plasmatube.appdata.xml'

    _line=$(
      grep -E "$_regex" "$_file" | head -1
    )
    _version=$(
      printf '%s' "$_line" | sed -E "s@$_regex@\1@"
    )
    _commit=$(
      git log -G "$_line" -1 --pretty=oneline --no-color -- $_file \
        | sed 's@\ .*$@@'
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
fi

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgname"
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D CMAKE_BUILD_TYPE=Release
    -D BUILD_TESTING=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
