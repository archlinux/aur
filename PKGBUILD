# Maintainer: xiota / aur.chaotic.cx

_pkgname="dolphin"
_pkgname_tabopts="$_pkgname-tabopts"
pkgname="$_pkgname_tabopts"
pkgver=23.08.2
pkgrel=2
pkgdesc='KDE File Manager - with extended tab options'
arch=(i686 x86_64)
url="https://invent.kde.org/xiota/dolphin/-/merge_requests/1"
license=(LGPL)
depends=(
  'baloo-widgets'
  'kactivities5'
  'kcmutils5'
  'kio-extras'
  'knewstuff5'
  'kparts5'
  'kuserfeedback'
)
makedepends=(
  'extra-cmake-modules'
  'kdoctools5'
)
optdepends=(
  'ffmpegthumbs: video thumbnails'
  'kde-cli-tools: for editing file type options'
  'kdegraphics-thumbnailers: PDF and PS thumbnails'
  'kio-admin: for managing files as administrator'
  'konsole: terminal panel'
  'purpose5: share context menu'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
  # add tab options
  # "https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
  "dolphin-tabopts-1.patch"::"https://invent.kde.org/xiota/dolphin/-/merge_requests/1.patch"
)
sha256sums=(
  'a50de534a6049ec4e232b6bddb8b39a105287bd0f6eac934e4eaac50df6f0004'
)

if [ x"$_pkgname_tabopts" == x"$pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname-$pkgver"

  source+=(
    "https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"
  )
  sha256sums+=(
    '0bca082410c4a1ab0ac60f76b0fbefa31c749dabe8a57cb53a33806cf53f6b2f'
  )
else
  # git package
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
