# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt
pkgver=1.3.7
pkgrel=1
pkgdesc="Open source PDF editor"
arch=('x86_64')
url="https://jakubmelka.github.io/"
_ghurl="https://github.com/JakubMelka/PDF4QT"
license=('LGPL-3.0-only')
conflicts=("${pkgname}")
depends=(
	'openssl'
	'libjpeg-turbo'
	'qt6-speech'
	'qt6-svg'
	'qt6-base'
	'openjpeg2'
	'onetbb'
	'lcms2'
	'hicolor-icon-theme'
)
makedepends=(
	'git'
	'cmake'
	'qt6-declarative'
	'qt6-multimedia'
	'make'
	'gcc'
)
optdepends=(
	'flite: Text-To-Speech using flite synthesizer'
	'libspeechd: Text-To-Speech using speechd synthesizer'
)
options=('!strip')
source=(
	"${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
	"FindLCMS2.cmake"
)
sha256sums=('SKIP'
            '5f64f0b7a3e265cc02cbe0e968482337ed8d197a043d926d7714e938d1da9f34')
build() {
	sed "s|lcms2|LCMS2|g" -i "${srcdir}/${pkgname}.git/Pdf4QtLibCore/CMakeLists.txt"
	sed "s|lcms|LCMS2|g" -i "${srcdir}/${pkgname}.git/CMakeLists.txt"
	cmake -B build -S "${pkgname}.git" \
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