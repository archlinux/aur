# Maintainer: Alfredo Ramos <alfredo.ramos@proton.me>
# Contributor: Alison Watson <marrub@greyserv.net>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Corey Richardson <corey@octayn.net>

_pkgname=krita
pkgname=${_pkgname}-qt6-git
pkgver=6.0.0.prealpha.r64036.f1e19ad
pkgrel=1
pkgdesc='A full-featured free digital painting studio. Git version.'
arch=('x86_64')
url='https://krita.org'
license=('GPL-3.0-only')

depends=(
	exiv2 ffmpeg fftw fontconfig freetype2 fribidi gcc-libs giflib glibc gsl
	harfbuzz imath kcompletion kconfig kcoreaddons kcrash kguiaddons ki18n
	kitemviews kitemmodels kwidgetsaddons kwindowsystem lcms2 libjpeg-turbo
	libkdcraw libpng libtiff libunibreak libwebp mlt opencolorio openexr
	openjpeg2 qt6-base qt6-svg quazip-qt6 zlib
)
makedepends=(
	git boost eigen extra-cmake-modules immer kdoctools kseexpr-qt6 lager libheif
	libjxl libmypaint poppler-qt6 python-pyqt6 qt6-tools sip xsimd zug
)
optdepends=(
	'poppler-qt6: PDF filter'
	'python-pyqt6: for the Python plugins'
	'python-legacy-cgi: for the Python plugins'
	'libheif: HEIF filter'
	'kseexpr-qt6: SeExpr generator layer'
	'kimageformats: PSD support'
	'libmypaint: support for MyPaint brushes'
	'krita-plugin-gmic: GMic plugin'
	'libjxl: JPEG-XL filter'
)
provides=("${_pkgname}=${pkgver}")
conflicts=(calligra-krita krita-il10n krita)

source=("git+https://invent.kde.org/graphics/${_pkgname}.git"
"wayland.patch")
sha512sums=('SKIP'
            '36cc693d93dffc04e8aa894eaff37b5f29f059e98c08c5a433042ba1568f500958f2720b7fe27a284720c8ee794240c98144d4d51c53ec5ead5aaa0750f70e93')

pkgver() {
	cd ${_pkgname}
	printf "6.0.0.prealpha.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	patch -Np1 -i $srcdir/wayland.patch -d ${_pkgname}
	cmake -B build -S ${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_TESTING=OFF \
		-DBUILD_WITH_QT6=ON
	cmake --build build --clean-first
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
