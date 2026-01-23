# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt
pkgver=1.5.3.1
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
    'blend2d'
)
makedepends=(
    'git'
    'qt6-declarative'
    'qt6-multimedia'
    'qt6-tools'
    'cmake'
)
optdepends=(
    'flite: Text-To-Speech using flite synthesizer'
    'libspeechd: Text-To-Speech using speechd synthesizer'
)
options=('!strip')
source=("${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}")
sha256sums=('45cdef2479370572dfc54ec2cb8f714d353c0bb03dfbeeb11e5434eb2c4343f7'
            '5f64f0b7a3e265cc02cbe0e968482337ed8d197a043d926d7714e938d1da9f34')
prepare() {
    cd "${srcdir}/${pkgname}.git"
    sed -i "s/OpenJPEG CONFIG REQUIRED/OpenJPEG REQUIRED/g" "${srcdir}/${pkgname}.git/CMakeLists.txt"
    sed -i "s/PDF4QT_PLUGINS_DIR \${PDF4QT_INSTALL_LIB_DIR}\/${pkgname}/PDF4QT_PLUGINS_DIR \/\${PDF4QT_INSTALL_LIB_DIR}\/${pkgname}/g" \
        "${srcdir}/${pkgname}.git/Pdf4QtEditorPlugins/CMakeLists.txt"
    sed -i "24i\message(PDF4QT_PLUGINS_DIR=\${PDF4QT_PLUGINS_DIR})" "${srcdir}/${pkgname}.git/Pdf4QtEditorPlugins/CMakeLists.txt"
    sed -i "s/\.\/\%1/\/usr\/bin\/\%1/g" "${srcdir}/${pkgname}.git/Pdf4QtLaunchPad/launchdialog.cpp"
    cmake -B "${srcdir}/${pkgname}.git/build" \
        -S "${srcdir}/${pkgname}.git" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/' \
        -Wno-dev \
        -DCMAKE_MODULE_PATH="${srcdir}" \
        -DPDF4QT_INSTALL_DEPENDENCIES=0 \
        -DPDF4QT_LINUX=1
}
build() {
    cd "${srcdir}/${pkgname}.git"
    cmake --build "${srcdir}/${pkgname}.git/build"
}
package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/${pkgname}.git/build"
}