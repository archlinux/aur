# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=jamtaba
_pkgname=JamTaba
pkgver=2.1.16
pkgrel=1
pkgdesc="Ninjam online music jamsession client."
arch=('i686' 'x86_64')
url="https://jamtaba-music-web-site.appspot.com/"
license=('unknown') # TBD, see https://github.com/elieserdejesus/JamTaba/issues/1210
depends=('qt5-base' 'portaudio' 'ffmpeg' 'x264' 'miniupnpc' 'libvorbis' 'libogg' 'alsa-lib' 'qt5-websockets' 'qt5-multimedia')
makedepends=('steinberg-vst36')
conflicts=()
provides=('jamtaba')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/elieserdejesus/JamTaba/archive/v${pkgver}.tar.gz"
    "package.patch"
)
sha256sums=('85877308bdb8f01b8001b3b803d10f7b7b10f7f6dfb428dfda64a4f0a427e0e7' 'd4bc9cbc29332af16328a04f75ee6693e3858eac21545cdba38fd536113f0bdc')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/package.patch"
    sed -i "s|_DEST_DIR.*$|/usr/bin/jamtaba|; s|Jamtaba2\.png|jamtaba|" "installers/linux/Jamtaba2.desktop"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/src/Common/minimp3"
    gcc -c -D__int8_t_defined=1 -o minimp3.o minimp3.c
    ar rcs libminimp3.a minimp3.o

    cd "${srcdir}/${_pkgname}-${pkgver}/PROJECTS/Standalone"
    export CXXFLAGS="${CXXFLAGS} -I${srcdir}/${_pkgname}-${pkgver}/src/Common/minimp3 -I/usr/include/vst36/pluginterfaces/vst2.x -I/usr/include/miniupnpc"
    export LDFLAGS="${LDFLAGS} -L${srcdir}/${_pkgname}-${pkgver}/src/Common/minimp3"
    qmake Standalone.pro
    make -j 4
}

package() {
    install -D -m755 "${srcdir}/${_pkgname}-${pkgver}/PROJECTS/Standalone/Jamtaba2" "${pkgdir}/usr/bin/jamtaba"
    install -D -m644 "${srcdir}/${_pkgname}-${pkgver}/installers/linux/Jamtaba2.desktop" "${pkgdir}/usr/share/applications/jamtaba.desktop"
    install -D -m644 "${srcdir}/${_pkgname}-${pkgver}/installers/linux/Jamtaba2.png" "${pkgdir}/usr/share/pixmaps/jamtaba.png"
}

# vim: set ts=4 sw=4 :
