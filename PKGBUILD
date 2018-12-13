# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

_pkgname=krita
pkgname="${_pkgname}-minimal"
pkgver=4.1.7
pkgrel=1
pkgdesc='Edit and paint images (less KDE dependencies)'
arch=(x86_64)
url='https://krita.org'
license=(GPL3)
depends=(karchive kcompletion kcoreaddons ki18n kitemmodels kitemviews
         qt5-svg qt5-multimedia qt5-x11extras gsl libraw exiv2 openexr fftw curl
         boost-libs giflib hicolor-icon-theme desktop-file-utils)
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
        'replace-code.patch')
sha256sums=('c16ec0dd23cdf20e9dd4d34ebabcf5bdb06a825bd6fe2c7196d6777279bdabd0'
            'SKIP'
            '3cf0c0b134687e784d66c6103b2bf78a559a0b698e746b5803a6d7419098315f')
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
