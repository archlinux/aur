# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Alison Watson <marrub@greyserv.net>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Corey Richardson <corey@octayn.net>

_pkgname=krita
pkgname=${_pkgname}-git
pkgver=4.3.0.prealpha.6708.g97865cd60c
pkgrel=1
pkgdesc='A full-featured free digital painting studio. Git version.'
arch=('x86_64')
url='https://krita.org'
license=('GPL3')

depends=(
	kitemviews kitemmodels ki18n kcompletion karchive kguiaddons kcrash
	qt5-svg qt5-multimedia quazip gsl libraw exiv2 openexr fftw giflib
	openjpeg2 opencolorio1 hicolor-icon-theme
)
makedepends=(
	git extra-cmake-modules kdoctools boost eigen vc poppler-qt5
	python-pyqt5 libheif sip4 python-sip4 kseexpr
)
optdepends=(
	'poppler-qt5: PDF filter'
	'ffmpeg: to save animations'
	"krita-plugin-gmic: G'MIC plugin"
	'python-pyqt5: for the Python plugins'
	'libheif: HEIF filter'
	'kseexpr: SeExpr generator layer'
	'kimageformats: PSD support'
)
provides=("${_pkgname}=${pkgver}")
conflicts=(calligra-krita krita-il10n krita)

source=(
	"git+https://github.com/KDE/${_pkgname}.git"
	'https://raw.githubusercontent.com/archlinux/svntogit-packages/4877333d60835f6531cc990af955cedb39158893/trunk/krita-opencolorio1.patch'
)
sha256sums=(
	'SKIP'
	'2f892449e20abc370fe3dc8b5dd12f9964d1d402a909e775641e28685b1719b3'
)

pkgver() {
	cd ${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	patch -d ${_pkgname} -Np1 < krita-opencolorio1.patch
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
