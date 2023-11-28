# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt
pkgver=1.3.6
pkgrel=1
pkgdesc="Open source PDF editor"
arch=('x86_64')
url="https://jakubmelka.github.io/"
license=('LGPL3')
depends=('openssl'
	'libjpeg-turbo'
	'qt6-speech'
	'qt6-svg'
	'qt6-base'
	'openjpeg2'
	'onetbb'
	'lcms2'
	'freetype2'
	'zlib'
	'glibc'
	'gcc-libs'
)
makedepends=('git'
	'cmake'
	'qt6-declarative'
	'qt6-multimedia'
)
optdepends=(
	'flite: Text-To-Speech using flite synthesizer',
	'libspeechd: Text-To-Speech using speechd synthesizer'
)
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")

source=("${pkgname}.tar.gz"::"https://github.com/JakubMelka/PDF4QT/archive/refs/tags/v${pkgver}.tar.gz"
	'CMakePatch.patch'
	'FindLCMS2.cmake')
b2sums=('48d0ec95ac2f47eccccb0bee5900b689cf2556d792b32e8c8b198c54030969e4be7b6e14c86fc94e25eaff79578874bd9d4b32e926f6802107f556dda9bc968f'
        'be47f2902d2639170b6fc10742b118cd14b263f30d2225aa601820cb33f946d1d9b5f032fd9c0671e1ac4936c072ff4c6dc7f57c7a53f95f1ad59ba5c2b3ff1c'
        'd26119741d02bddc6e18234aeb9d437ed866676f126e073f87efa8f19e3eedfbb77d2f571ff0e1c3963fabc86e1db83b7a1864edfdc1ba8f63cdd1e36da1e382')

prepare() {
	cd "${srcdir}/${pkgname^^}-${pkgver}"
	patch -p1 -i "${srcdir}/CMakePatch.patch"
}

build() {
	cmake -B build -S "${pkgname^^}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/' \
		-Wno-dev \
		-DCMAKE_MODULE_PATH="${srcdir}" \
		-DPDF4QT_INSTALL_DEPENDENCIES=0
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
