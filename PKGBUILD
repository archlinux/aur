# Maintainer: xiota / aur.chaotic.cx

_pkgname="dolphin"
_pkgname_tabopts="$_pkgname-tabopts"
pkgname="$_pkgname_tabopts"
pkgver=23.08.3
pkgrel=1
pkgdesc='KDE File Manager - with extended tab options'
url="https://invent.kde.org/xiota/dolphin/-/merge_requests/1"
license=(LGPL)
arch=(i686 x86_64)

depends=(
  'baloo-widgets'
  'kio-extras'
)
makedepends=(
  'extra-cmake-modules'
)
optdepends=(
  'ffmpegthumbs: video thumbnails'
  'kde-cli-tools: for editing file type options'
  'kdegraphics-thumbnailers: PDF and PS thumbnails'
  'kio-admin: for managing files as administrator'
  'konsole: terminal panel'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

if [ x"$pkgname" == x"$_pkgname_tabopts" ] ; then
  # normal package
  depends+=(
    'kactivities5'
    'kcmutils5'
    'knewstuff5'
    'kparts5'
    'kuserfeedback5'
  )
  makedepends+=(
    'kdoctools5'
  )
  optdepends+=(
    'purpose5: share context menu'
  )

  _pkgsrc="$_pkgname-${pkgver%%.r*}"
  _pkgext="tar.xz"

  source+=(
    "$_pkgsrc.$_pkgext"::"https://download.kde.org/stable/release-service/${pkgver%%.r*}/src/$_pkgsrc.$_pkgext"
    # "https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
    "dolphin-tabopts-1.patch"::"https://invent.kde.org/xiota/dolphin/-/merge_requests/1.patch"
  )
  sha256sums+=(
    'd54e877d893ddf3d59752da723c881471bc06aee2e4143ff7e034fdffd7bba9e'
    'a50de534a6049ec4e232b6bddb8b39a105287bd0f6eac934e4eaac50df6f0004'
  )

  pkgver() {
    printf '%s' "${pkgver%%.r*}"
  }
else
  # git package
  depends+=(
    'kactivities'
    'kcmutils'
    'knewstuff'
    'kparts'
    'kuserfeedback'
  )
  makedepends+=(
    'git'
    'kdoctools'
  )
  optdepends+=(
    'purpose: share context menu'
  )

  _pkgsrc="$_pkgname"
  source+=(
    "$_pkgname"::"git+https://invent.kde.org/system/dolphin.git"
    "dolphin-tabopts-2.patch"::"https://invent.kde.org/xiota/dolphin/-/commit/33c2ff50e2611eb04d8a3ad8f30b18aecda42544.patch"
  )
  sha256sums+=(
    'SKIP'
    '43bb309c9815bb7abe6b4a4a4cc9084c4809709c6b037a24cf56bb232b42398f'
  )

  pkgver() {
    cd "$_pkgsrc"

    _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)"\s.*/>$'
    _file='src/org.kde.dolphin.appdata.xml'

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
fi

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]] ; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() {
  cmake -B build -S "$_pkgsrc" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
