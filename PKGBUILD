# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Alison Watson <marrub@greyserv.net>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Corey Richardson <corey@octayn.net>

_pkgname=krita
pkgname=${_pkgname}-git
pkgver=4.3.0.prealpha.3252.ga899f2f428
pkgrel=2
pkgdesc='A full-featured free digital painting studio. Git version.'
arch=('x86_64')
url='https://krita.org'
license=('GPL3')

depends=(kitemviews kitemmodels ki18n kcompletion karchive kguiaddons kcrash
         qt5-svg qt5-multimedia quazip gsl libraw exiv2 openexr fftw curl
         boost-libs giflib hicolor-icon-theme)
makedepends=(git extra-cmake-modules kdoctools boost eigen vc poppler-qt5
             opencolorio python-pyqt5 libheif sip python-sip)
optdepends=('poppler-qt5: PDF filter' 'ffmpeg: to save animations'
            'opencolorio: for the LUT docker' "krita-plugin-gmic: G'MIC plugin"
            'python-pyqt5: for the Python plugins' 'libheif: HEIF filter')
provides=("${_pkgname}=${pkgver}")
conflicts=(calligra-krita krita-il10n krita)

source=("git+https://github.com/KDE/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	mkdir -p "${srcdir}"/build
}

build() {
	cd "${srcdir}"/build
	cmake ../${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_TESTING=OFF
	make
}

package() {
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
