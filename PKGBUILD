

pkgname=qtgrace
pkgver=0.2.7
_pkgver=027
_pkgdirname=QtGrace6-0.27
pkgrel=2
pkgdesc="A program to display or plot data, analyze data and prepare it for printing, Qt version of the Grace"
arch=('i686' 'x86_64')
#url="http://plasma-gate.weizmann.ac.il/Grace/"
url="https://github.com/yesint/QtGrace6"
#url="http://sourceforge.net/projects/qtgrace/"
license=('GPL-2.0-only')
depends=('qt6-svg')
optdepends=('fftw: for better fourier-transformation'
            'libharu: for pdf-output')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yesint/QtGrace6/archive/refs/tags/v0.27.tar.gz" "${pkgname}.png" "${pkgname}.desktop" "${pkgname}-mimetypes" "${pkgname}")
md5sums=('c6e8f942e94708316ffd1c75fc9eb721'
         '935df82970eaf9b38b1f5ab26ed45a8d'
         'd1bbdd58b4479f4dc27b0bee3d8d0fca'
         '3beba5237f56a2ff28b6cd878865b25c'
         '21b708638a6d63224e05582873be0e4f')
sha256sums=('cad35244343be29a0327df6bc80d7104844350adb87f778513babd4a152382a3'
            '53285847eb5214a8ef86593bb1f2791d6e01cfed4bb97323ad86d070ed3f6b98'
            'b8351ba9f8a7cd5033eb453ab56e01771aba02b47d3ab4b70f29b4a138a55a36'
            '00c16404b9c9386c32a298a3ec8842d2bef8ad6b278a817157ee4af65fcf1479'
            '7ee2c36f058bbac902fd52b88b2129e43b39c34828281d45342d1b09ac262d79')


prepare() {
    cd "$srcdir/${_pkgdirname}"
    rm -rf build && mkdir build
}

build() {
    cd "$srcdir/${_pkgdirname}"

    cd build
    cmake ..
  # DESTDIR="${pkgdir}" PREFIX="/usr" qmake ./src/src.pro
    make
}

package() {
    cd "${srcdir}"

    install -d -m755 "${pkgdir}/usr/share/${pkgname}"
    cp  "${_pkgdirname}/gracerc" "${pkgdir}/usr/share/${pkgname}/gracerc"
    cp  "${_pkgdirname}/gracerc.user" "${pkgdir}/usr/share/${pkgname}/gracerc.user"
    cp -r "${_pkgdirname}/fonts" "${pkgdir}/usr/share/${pkgname}"
    cp -r "${_pkgdirname}/examples" "${pkgdir}/usr/share/${pkgname}"
    cp -r "${_pkgdirname}/templates" "${pkgdir}/usr/share/${pkgname}"
    cp -r "${_pkgdirname}/doc" "${pkgdir}/usr/share/${pkgname}"
    find "${pkgdir}/usr/share/${pkgname}/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)

    install -D -m755 "${_pkgdirname}/build/${pkgname}" "${pkgdir}/usr/share/${pkgname}/bin/${pkgname}"
    install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Desktop integration
    install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${srcdir}/${pkgname}-mimetypes" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
}


