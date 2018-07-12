# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

_pkgname=krita
pkgname="${_pkgname}-minimal"
pkgver=4.1.0
pkgrel=2
pkgdesc='Edit and paint images (less KDE dependencies)'
arch=(x86_64)
url='https://krita.org'
license=(GPL3)
depends=(karchive kcompletion kcoreaddons ki18n kitemviews qt5-svg
         qt5-multimedia qt5-x11extras kitemmodels
         gsl libraw exiv2 openexr fftw curl boost-libs giflib qt5-declarative hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools python boost eigen vc poppler-qt5 opencolorio
             python-pyqt5 libheif sip python-sip)
optdepends=('poppler-qt5: PDF filter'
            'ffmpeg: to save animations'
            'opencolorio: for the LUT docker'
            "krita-plugin-gmic: G'MIC plugin"
            'python-pyqt5: for the Python plugins'
            'libheif: HEIF filter')
provides=("${_pkgname}=${pkgver}")
conflicts=(calligra-krita krita-l10n "${_pkgname}")
source=("https://download.kde.org/stable/krita/$pkgver/${_pkgname}-$pkgver.tar.gz"{,.sig}
        'krita-pyqt5.11.patch'
        'replace-code.patch')
sha256sums=('78792df8165b986b806dcf9960a2679f683f2263e06f3ad5a24b0f78d8f27ed5'
            'SKIP'
            '37aa93119c759d80829112f169f64c47450f218e0fe05fc2e16ae54ff8170db2'
            '1e076c7de3ee1bd6622cd40d227d0c687170b410f0e297f78f97e0b7f7270d6d')
validpgpkeys=('05D00A8B73A686789E0A156858B9596C722EA3BD') # Boudewijn Rempt <foundation@krita.org>

prepare() {
  mkdir -p build
  cd "${_pkgname}-$pkgver"
  patch -Np1 -i '../krita-pyqt5.11.patch' # Fix python plugins with PyQt 5.11
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
