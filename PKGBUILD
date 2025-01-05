# Maintainer: Alfredo Ramos <alfredo.ramos@proton.me>
# Contributor: Alison Watson <marrub@greyserv.net>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Corey Richardson <corey@octayn.net>

_pkgname=krita
pkgname=${_pkgname}-git
pkgver=5.3.0.prealpha.2258.g83bdc0dc5f
pkgrel=1
pkgdesc='A full-featured free digital painting studio. Git version.'
arch=('x86_64')
url='https://krita.org'
license=('GPL-3.0-only')

depends=(
	exiv2 ffmpeg fftw fontconfig freetype2 fribidi gcc-libs giflib glibc gsl
	harfbuzz imath kcompletion5 kconfig5 kcoreaddons5 kcrash5 kguiaddons5 ki18n5
	kitemviews5 kitemmodels5 kwidgetsaddons5 kwindowsystem5 lcms2 libjpeg-turbo
	libkdcraw5 libpng libtiff libunibreak libwebp libx11 mlt opencolorio openexr
	openjpeg2 qt5-base qt5-svg qt5-x11extras quazip-qt5 zlib
)
makedepends=(
	git boost eigen extra-cmake-modules immer kdoctools5 kseexpr lager libheif
	libjxl libmypaint poppler-qt5 python-pyqt5 qt5-tools sip xsimd zug
)
optdepends=(
	'poppler-qt5: PDF filter'
	'python-pyqt5: for the Python plugins'
	'python-legacy-cgi: for the Python plugins'
	'libheif: HEIF filter'
	'kseexpr: SeExpr generator layer'
	'kimageformats5: PSD support'
	'libmypaint: support for MyPaint brushes'
	'krita-plugin-gmic: GMic plugin'
	'libjxl: JPEG-XL filter'
)
provides=("${_pkgname}=${pkgver}")
conflicts=(calligra-krita krita-il10n krita)

source=("git+https://invent.kde.org/graphics/${_pkgname}.git")
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
