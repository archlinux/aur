_pkgname=dolphin
pkgname="$_pkgname-tabopts"
pkgver=23.04.1
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
  "https://invent.kde.org/xiota/dolphin/-/merge_requests/1.patch"
)
sha256sums=(
  '3813d0fb06d62dfa049e716654ca361f83a689dd1434b4ba335f5d271d3605dd'
  '44c2dcbfb6b507b9935dcd41ca41acc6f6e987bbc47d3c5abb405ae153b16300'
)

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  for p in "$srcdir"/*.patch ; do
    patch -Np1 -F100 -i "$p"
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
