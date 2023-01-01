# Maintainer: Alfredo Ramos <alfredo.ramos@tutanota.com>
# Contributor: Alison Watson <marrub@greyserv.net>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Corey Richardson <corey@octayn.net>

_pkgname=krita
pkgname=${_pkgname}-git
pkgver=5.2.0.prealpha.969.g2ccd4c9688
pkgrel=1
pkgdesc='A full-featured free digital painting studio. Git version.'
arch=('x86_64')
url='https://krita.org'
license=('GPL3')

depends=(
	kitemviews kitemmodels ki18n kcompletion kguiaddons kcrash
	qt5-svg qt5-multimedia quazip gsl libraw exiv2 openexr fftw
	openjpeg2 opencolorio hicolor-icon-theme
)
makedepends=(
	git extra-cmake-modules kdoctools boost eigen poppler-qt5
	python-pyqt5 libheif qt5-tools sip kseexpr libmypaint libjxl xsimd
)
optdepends=(
	'poppler-qt5: PDF filter'
	'ffmpeg: to save animations'
	'python-pyqt5: for the Python plugins'
	'libheif: HEIF filter'
	'kseexpr: SeExpr generator layer'
	'kimageformats: PSD support'
	'libmypaint: support for MyPaint brushes'
	'krita-plugin-gmic: GMic plugin'
	'libjxl: JPEG-XL filter'
)
provides=("${_pkgname}=${pkgver}")
conflicts=(calligra-krita krita-il10n krita)

source=("git+https://github.com/KDE/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

build() {
	cmake -B build -S ${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_TESTING=OFF \
		-DBUILD_KRITA_QT_DESIGNER_PLUGINS=ON
	cmake --build build --clean-first
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
