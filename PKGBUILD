_pkgname="dolphin"
pkgname="$_pkgname-tabopts-git"
pkgver=22.04.0.r362.g3c4800408
pkgrel=1
pkgdesc='KDE File Manager - with tab options patch (git)'
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
  'git'
  'kdoctools'
)
optdepends=(
  'ffmpegthumbs: video thumbnails'
  'kde-cli-tools: for editing file type options'
  'kdegraphics-thumbnailers: PDF and PS thumbnails'
  'konsole: terminal panel'
  'purpose: share context menu'
)
groups=(kde-applications kde-system)
provides=("$_pkgname" "$_pkgname-git")
conflicts=(${provides[@]})
source=(
  "$_pkgname"::"git+https://invent.kde.org/system/dolphin.git"

  # add tab options
  "https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  git -C "$_pkgname" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  for p in "$srcdir"/*.patch ; do
    patch -Np1 -i "$p"
  done
}

build() {
  cmake -B build -S "$_pkgname" \
      -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
