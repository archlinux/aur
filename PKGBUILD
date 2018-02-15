# Maintainer: kitsunyan <kitsunyan@inbox.ru>

_pkgname=krita
pkgname="${_pkgname}-minimal"
pkgver=3.3.3
pkgrel=1
pkgdesc='Edit and paint images (less KDE dependencies)'
arch=(x86_64)
url='https://krita.org'
license=(GPL3)
depends=(karchive kcompletion kcoreaddons ki18n kitemviews qt5-svg
         kitemmodels gsl libraw exiv2 openexr fftw curl boost-libs hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools python boost eigen vc poppler-qt5 opencolorio)
optdepends=('poppler-qt5: PDF filter'
            'ffmpeg: to save animations'
            'opencolorio: for the LUT docker'
            "krita-plugin-gmic: G'MIC plugin")
provides=("${_pkgname}=${pkgver}")
conflicts=(calligra-krita krita-l10n "${_pkgname}")
replaces=(calligra-krita krita-l10n)
source=("https://download.kde.org/stable/krita/$pkgver/${_pkgname}-$pkgver.tar.gz"{,.sig}
        'replace-code.patch')
sha256sums=('bec04e3392e9b311477c5c6a50e2201b43a3afda91d9b24a0fc8e3399585865d'
            'SKIP'
            '8526f1ae1ad03c824d8d87a7bc54e25dcbb6509306171c8dd022016a59061986')
validpgpkeys=('05D00A8B73A686789E0A156858B9596C722EA3BD') # Boudewijn Rempt <foundation@krita.org>

prepare() {
  mkdir -p build
  cd "${_pkgname}-$pkgver"
  patch -Np1 -i '../replace-code.patch'
}

build() {
  cd build
  cmake "../${_pkgname}-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_DISABLE_FIND_PACKAGE_KF5KIO=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_KF5Crash=TRUE \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
