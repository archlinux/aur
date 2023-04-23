_pkgname=dolphin
pkgname="$_pkgname-tabopts"
pkgver=23.04.0
pkgrel=1
pkgdesc='KDE File Manager - with tab options patch'
arch=(i686 x86_64)
url="https://invent.kde.org/system/dolphin/-/merge_requests/269"
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
  "https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
)
sha256sums=(
  'cd49268a3b0309253587d424fbdffe25b26c951df7e6932a42f48cf34b006c50'
  '5fdc620d687ad0d8a6ca6f5e0457b7130b10da2a87a1e10bf1ef41295f8bf3a7'
)

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  for p in "$srcdir"/*.patch ; do
    patch -Np1 -i "$p"
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
