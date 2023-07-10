# Maintainer:

_pkgname=dolphin
pkgname="$_pkgname-tabopts"
pkgver=23.04.3
pkgrel=1
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
  "https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"

  # add tab options
  # "https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
  "dolphin-tabopts-1.patch"::"https://invent.kde.org/xiota/dolphin/-/merge_requests/1.patch"
)
sha256sums=(
  '28cab05a6390e067f3a9c5ca176ec412f52bf20f78dc82a12a460d252211da2f'
  '3a8d8d9f616471e24ac3833445766bc723c3cb8b31384e0bd08abc8dc4bb9e9d'
)

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  for patch in "$srcdir"/*.patch ; do
    if [ -f "$patch" ] ; then
      printf 'Applying patch: %s\n' "${patch##*/}"
      patch -Np1 -F100 -i "$patch"
    fi
  done
}

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
