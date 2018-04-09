# Maintainer: kitsunyan <kitsunyan@inbox.ru>

_pkgname=krita
pkgname="${_pkgname}-minimal"
pkgver=4.0.1
pkgrel=1
pkgdesc='Edit and paint images (less KDE dependencies)'
arch=(x86_64)
url='https://krita.org'
license=(GPL3)
depends=(karchive kcompletion kcoreaddons ki18n kitemviews qt5-svg kitemmodels
         gsl libraw exiv2 openexr fftw curl boost-libs giflib qt5-declarative hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools python boost eigen vc poppler-qt5 opencolorio python-pyqt5)
optdepends=('poppler-qt5: PDF filter'
            'ffmpeg: to save animations'
            'opencolorio: for the LUT docker'
            "krita-plugin-gmic: G'MIC plugin"
            'python-pyqt5: for the Python plugins')
provides=("${_pkgname}=${pkgver}")
conflicts=(calligra-krita krita-l10n "${_pkgname}")
source=("https://download.kde.org/stable/krita/$pkgver/${_pkgname}-$pkgver.tar.gz"{,.sig}
        'replace-code.patch')
sha256sums=('da44e964cb2c0e409b18f3d50f92734d6e6e15e2ce494659b6dc52fed8d8218c'
            'SKIP'
            '8b0103ec49c7fa4930d9e0fb3063d11ee7145356a2a851d3a44f45a8e5404246')
validpgpkeys=('05D00A8B73A686789E0A156858B9596C722EA3BD') # Boudewijn Rempt <foundation@krita.org>

prepare() {
  mkdir -p build
  cd "${_pkgname}-$pkgver"
  patch -Np1 -i '../replace-code.patch'
}

build() {
  cd build
  cmake "../${_pkgname}-$pkgver" \
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
