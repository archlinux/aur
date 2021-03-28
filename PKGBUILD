# Maintainer: taotieren <admin@taotieren.com>
_pkgname=SerialTool
pkgname=serialtool-git
_softname=serialtool
pkgver=1.4.0alpha.0.21.gf25f840
pkgrel=1
pkgdesc="A practical Serial-Port/TCP/UDP debugging tool."
arch=('any')
url="https://github.com/Skiars/SerialTool"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname} 'serialtool')
#replaces=(${pkgname})
depends=('qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script' 'icoutils')
makedepends=('git' 'qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script' 'qt5-tools')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${_pkgname}::git+https://github.com/Skiars/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}/${_pkgname}"
    git describe --tag | sed -e 's/^[^0-9]*//' -e 's/-/.0./' -e 's/-/./g'
}

build() {
    cd ${srcdir}/${_pkgname}/${_pkgname}/
    qmake ${_pkgname}.pro
    make
}

package() {

    install -dm755 "${pkgdir}/usr/bin/" \
                   "${pkgdir}/usr/share/${_softname}/" 

    cd ${srcdir}/${_pkgname}/${_pkgname}/
    cp --preserve=mode -r ${_pkgname} language config themes slave  "${pkgdir}/usr/share/${_softname}/"
    
    cd pkg/
    cp --preserve=mode -r icons "${pkgdir}/usr/share/"

    ln -sf  "/usr/share/${_softname}/${_pkgname}" "${pkgdir}/usr/bin/${_softname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_softname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}/pkg/io.github.skiars.${_softname}.desktop" "${pkgdir}/usr/share/applications/io.github.skiars.${_softname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
    install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}/pkg/io.github.skiars.${_softname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.skiars.${_softname}.metainfo.xml"
}
