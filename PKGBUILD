# Maintainer: taotieren <admin@taotieren.com>
_pkgname=SerialTool
pkgname=serialtool-git
_softname=serialtool
pkgver=1.4.0alpha.0.1.g20896fb
pkgrel=2
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
source=("${_pkgname}::git+https://github.com/Skiars/${_pkgname}.git"
        "${_softname}.desktop"
        "20-usb-serial.rules"
        "${pkgname}.install"
        "io.github.skiars.serialtool.metainfo.xml")
sha256sums=('SKIP'
            'f646db8d3d577589da15a555653a91ae725be626c933e384ba07db8b9bdc30c8'
            'bd504256698f7e7b1a74fbc6490276f0c096c2e6b5e7199049766b7ba7c860a7'
            '303f34246c0d341e1093d6e486e2cbfdbbb0d122d751de649f562ebac37777b4'
            '41a8f888c8bccdd06a808469a2d37183879b1244b822b397e14bf1b2a013bdc7')

pkgver() {
    cd "${srcdir}/${_pkgname}/${_pkgname}"
    git describe --tag | sed -e 's/^[^0-9]*//' -e 's/-/.0./' -e 's/-/./g'
}

build() {
    cp -r "${srcdir}/${_pkgname}/${_pkgname}/resource/images/logo.ico" "${srcdir}/${_pkgname}/${_softname}.ico"
    cd "${srcdir}/${_pkgname}/"
    icotool -x "${_softname}.ico"
    
    cd ${srcdir}/${_pkgname}/${_pkgname}/
    qmake ${_pkgname}.pro
    make
}

package() {

    install -dm755 "${pkgdir}/usr/bin/" \
                   "${pkgdir}/usr/share/${_softname}/" 

    cd ${srcdir}/${_pkgname}/${_pkgname}/
    cp --preserve=mode -r ${_pkgname} language config themes slave  "${pkgdir}/usr/share/${_softname}/"

    ln -sf  "/usr/share/${_softname}/${_pkgname}" "${pkgdir}/usr/bin/${_softname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_softname}/LICENSE"
    install -Dm644 "${srcdir}/${_softname}.desktop" "${pkgdir}/usr/share/applications/${_softname}.desktop"
    install -Dm644 "${srcdir}/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
    install -Dm644 "${srcdir}/io.github.skiars.serialtool.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.skiars.serialtool.metainfo.xml"

    install -Dm644 "${srcdir}/${_pkgname}/${_softname}_7_16x16x32.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_softname}.png"
    install -Dm644 "${srcdir}/${_pkgname}/${_softname}_6_20x20x32.png" "${pkgdir}/usr/share/icons/hicolor/20x20/apps/${_softname}.png"
    install -Dm644 "${srcdir}/${_pkgname}/${_softname}_5_24x24x32.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${_softname}.png"
    install -Dm644 "${srcdir}/${_pkgname}/${_softname}_4_32x32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_softname}.png"
    install -Dm644 "${srcdir}/${_pkgname}/${_softname}_3_64x64x32.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_softname}.png"
    install -Dm644 "${srcdir}/${_pkgname}/${_softname}_2_128x128x32.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_softname}.png"
    install -Dm644 "${srcdir}/${_pkgname}/${_softname}_1_256x256x32.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_softname}.png"
}
