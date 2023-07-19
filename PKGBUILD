# Maintainer:

_pkgname="dolphin"
_pkgname_tabopts="$_pkgname-tabopts"
pkgname="$_pkgname_tabopts"
pkgver=23.04.3
pkgrel=2
pkgdesc='KDE File Manager - with extended tab options'
arch=(i686 x86_64)
url="https://invent.kde.org/xiota/dolphin/-/merge_requests/1"
license=(LGPL)
depends=(
  'baloo-widgets'
  'kactivities'
  'kcmutils'
  'kio-extras'
  'knewstuff'
  'kparts'
  'kuserfeedback'
)
makedepends=(
  'extra-cmake-modules'
  'kdoctools'
)
optdepends=(
  'ffmpegthumbs: video thumbnails'
  'kde-cli-tools: for editing file type options'
  'kdegraphics-thumbnailers: PDF and PS thumbnails'
  'kio-admin: for managing files as administrator'
  'konsole: terminal panel'
  'purpose: share context menu'
)

provides=("$_pkgname")
conflicts=(${provides[@]})
groups=(kde-applications kde-system)

source=(
  # add tab options
  # "https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
  "dolphin-tabopts-1.patch"::"https://invent.kde.org/xiota/dolphin/-/merge_requests/1.patch"
)
sha256sums=(
  '7e649204637ccd1d3c9e9e748e69f73ac97e1c308c63eda592353ca7df21cb0d'
)

if [ x"$_pkgname_tabopts" == x"$pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname-$pkgver"

  source+=(
    "https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"
  )
  sha256sums+=(
    '28cab05a6390e067f3a9c5ca176ec412f52bf20f78dc82a12a460d252211da2f'
  )
else
  # x-git package
  _pkgsrc="$_pkgname"

  makedepends+=('git')

  source+=(
    "$_pkgname"::"git+https://invent.kde.org/system/dolphin.git"
  )
  sha256sums+=(
    'SKIP'
  )

  pkgver() {
    cd "$srcdir/$_pkgsrc"

    _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)"\s.*/>$'
    _file='src/org.kde.dolphin.appdata.xml'

    _line=$(
      grep -E "$_regex" "$_file" | head -1
    )
    _version=$(
      printf '%s\n' "$_line" \
        | sed -E "s@$_regex@\1@"
    )
    _commit=$(
      git log -S "$_line" -1 --pretty=oneline --no-color | sed 's@\ .*$@@'
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

prepare() {
  cd "$srcdir/$_pkgsrc"

  for patch in "$srcdir"/*.patch ; do
    if [ -f "$patch" ] ; then
      printf 'Applying patch: %s\n' "${patch##*/}"
      patch -Np1 -F100 -i "$patch"
    fi
  done
}

build() {
  cmake -B build -S "$_pkgsrc" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
