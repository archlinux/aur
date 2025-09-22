# Maintainer: Alfredo Ramos <alfredo.ramos@proton.me>
# Contributor: Alison Watson <marrub@greyserv.net>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Corey Richardson <corey@octayn.net>

_pkgname=krita
pkgname=${_pkgname}-git
pkgver=6.0.0.prealpha.r64810.a11121827f
pkgrel=1
pkgdesc='A full-featured free digital painting studio. Qt 6 git version.'
arch=('x86_64')
url='https://krita.org'
license=('GPL-3.0-only')

depends=(
	exiv2 ffmpeg fftw fontconfig freetype2 fribidi gcc-libs giflib glibc gsl
	harfbuzz imath kcolorscheme kcompletion kconfig kcoreaddons kcrash kguiaddons
	ki18n kitemviews kitemmodels kwidgetsaddons kwindowsystem lcms2 libjpeg-turbo
	libkdcraw libpng libtiff libunibreak libwebp mlt sdl2 opencolorio openexr
	openjpeg2 qt6-base qt6-svg quazip-qt6 zlib
)
makedepends=(
	git ninja boost eigen extra-cmake-modules immer kdoctools kseexpr-qt6-git lager libheif
	libjxl libmypaint poppler-qt6 python-pyqt6 qt6-tools sip xsimd zug vulkan-headers
)
optdepends=(
	'poppler-qt6: PDF filter'
	'python-pyqt6: for the Python plugins'
	'python-legacy-cgi: for the Python plugins'
	'libheif: HEIF filter'
	'kseexpr-qt6-git: SeExpr generator layer'
	'kimageformats: PSD support'
	'libmypaint: support for MyPaint brushes'
	'krita-plugin-gmic: GMic plugin'
	'libjxl: JPEG-XL filter'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-qt6-git")

source=("git+https://invent.kde.org/graphics/${_pkgname}.git")
sha512sums=('SKIP')

prepare() {
	cd "${_pkgname}"
	# Fix for Eigen3 5
	sed -Ei 's/(Eigen3)\s+3\.3/\1 5/i' CMakeLists.txt
}

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" \
		"$(
			grep 'set(KRITA_VERSION_STRING' CMakeLists.txt | \
			sed -nE 's/.*set\(KRITA_VERSION_STRING *"([0-9]+)\.([0-9]+)\.([^"]+)"\).*/\1.\2.\3/p' | \
			grep -E '^[6-9]\.|^[1-9][0-9]+\.' | sed -r 's/-/./g' \
		)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=10 HEAD)"
}

build() {
	cmake -B build -S "${_pkgname}" -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_WITH_QT6=ON \
		-DBUILD_TESTING=OFF \
		-DBUILD_KRITA_QT_DESIGNER_PLUGINS=ON
	cmake --build build --clean-first
}

package() {
	cmake --install build --strip --prefix="${pkgdir}/usr"
}
