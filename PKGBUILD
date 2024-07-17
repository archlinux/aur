# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt
pkgver=1.4.0.0
pkgrel=2
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
	'blend2d'
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
sha256sums=('d0d37cc14a99a1714417c9193d03121976e5bc292035182951d505a2441d76c1'
            '5f64f0b7a3e265cc02cbe0e968482337ed8d197a043d926d7714e938d1da9f34')
build() {
	sed "s|lcms2|LCMS2|g" -i "${srcdir}/${pkgname}.git/Pdf4QtLibCore/CMakeLists.txt"
	sed "s|lcms|LCMS2|g;s|OpenJPEG CONFIG REQUIRED|OpenJPEG REQUIRED|g" -i "${srcdir}/${pkgname}.git/CMakeLists.txt"
	sed "s|PDF4QT_PLUGINS_DIR \${PDF4QT_INSTALL_LIB_DIR}\/${pkgname}|PDF4QT_PLUGINS_DIR \/\${PDF4QT_INSTALL_LIB_DIR}\/${pkgname}|g" \
		-i "${srcdir}/${pkgname}.git/Pdf4QtEditorPlugins/CMakeLists.txt"
	sed "24i\message(PDF4QT_PLUGINS_DIR=\${PDF4QT_PLUGINS_DIR})" -i "${srcdir}/${pkgname}.git/Pdf4QtEditorPlugins/CMakeLists.txt"
	sed "s|setMatrix|setTransform|g;s|userMatrix|userTransform|g" -i "${srcdir}/${pkgname}.git/Pdf4QtLibCore/sources/pdfblpainter.cpp"
	cmake -B build \
		-S "${srcdir}/${pkgname}.git" \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_INSTALL_PREFIX='/' \
		-Wno-dev \
		-DCMAKE_MODULE_PATH="${srcdir}" \
		-DPDF4QT_INSTALL_DEPENDENCIES=0 \
		-DPDF4QT_LINUX=1
  	cmake --build build
}
package() {
	DESTDIR="${pkgdir}" cmake --install build
}