# Maintainer: taotieren <admin@taotieren.com>
_pkgname=SerialTool
pkgname=serialtool-git
_softname=serialtool
pkgver=1.4.0alpha.0.1.g20896fb
pkgrel=1
pkgdesc="A practical Serial-Port/TCP/UDP debugging tool."
arch=('any')
url="https://github.com/Skiars/SerialTool"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname} 'serialtool')
#replaces=(${pkgname})
depends=('qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script')
makedepends=('git' 'coreutils' 'qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script' 'qt5-tools')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${_pkgname}::git+https://github.com/Skiars/${_pkgname}.git"
        "${_softname}.desktop"
        "20-usb-serial.rules"
        "${pkgname}.install")
sha256sums=('SKIP'
            '0fc47631291ea6b1d5d62af0a709a1a234fa354cc807b4a368f9fa93b7f97bbe'
            'bd504256698f7e7b1a74fbc6490276f0c096c2e6b5e7199049766b7ba7c860a7'
            '303f34246c0d341e1093d6e486e2cbfdbbb0d122d751de649f562ebac37777b4')

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

    ln -sf  "/usr/share/${_softname}/${_pkgname}" "${pkgdir}/usr/bin/${_softname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_softname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}/resource/images/logo.ico" "${pkgdir}/usr/share/pixmaps/${_softname}.ico"
    install -Dm644 "${srcdir}/${_softname}.desktop" "${pkgdir}/usr/share/applications/${_softname}.desktop"
    install -Dm644 "${srcdir}/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
}
