_pkgname=dolphin
pkgname="${_pkgname}-tabopts"
pkgver=22.12.0
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

  # add tab options
  https://invent.kde.org/system/dolphin/-/merge_requests/269.patch

  # fix copy-pasting issues
  https://invent.kde.org/system/dolphin/-/commit/c8aed8ac.patch

  # fix regressions; revert KIO removal
  https://invent.kde.org/system/dolphin/-/merge_requests/480.patch
)
sha256sums=(
  '487c04953a7b505a638adce16cb3d4df3a3345ffc27e069d4f84730e4ad6ac26'
  '5fdc620d687ad0d8a6ca6f5e0457b7130b10da2a87a1e10bf1ef41295f8bf3a7'
  'ce74e2e5079ebe2522bf2420c25a74a524cef47502311bb7e602d906813fcf24'
  'df86b0fad61a6be28361456983b462af180bf3fc891ae095fc611a11ba8dee86'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for p in "${srcdir}/"*.patch ; do
    patch -p1 -i "$p"
  done
}

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
