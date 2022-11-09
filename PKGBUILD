_pkgname=dolphin
pkgname="${_pkgname}-tabopts"
pkgver=22.08.3
pkgrel=1
pkgdesc='KDE File Manager - with tab options patch'
arch=(x86_64)
url='https://apps.kde.org/dolphin/'
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
makedepends=(extra-cmake-modules kdoctools)
optdepends=(
  'ffmpegthumbs: video thumbnails'
  'kde-cli-tools: for editing file type options'
  'kdegraphics-thumbnailers: PDF and PS thumbnails'
  'konsole: terminal panel'
  'purpose: share context menu'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=(kde-applications kde-system)
source=(
  https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz
  "tab-options.patch"::"https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
)
sha256sums=(
  '971489a59cdd6b297e2142eb3315847addafbc4e3504e1609fe5e1d119cf15a3'
  '5fdc620d687ad0d8a6ca6f5e0457b7130b10da2a87a1e10bf1ef41295f8bf3a7'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/tab-options.patch"
}

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
