# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt
pkgver=1.3.6
pkgrel=2
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
sha256sums=('43c50e87e0b5eea15d4e703153f124aeb8e026d5979cb64ef8760422dce0b18f'
	'44a1eae1836a563466264967c5dbf27769dbc41a3750dbed621336b1b7dcdf47'
	'fb438faf87211cf3c21c6fa624cedd2ec6af49b03827e1ad230e0202e939a8ec')

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
