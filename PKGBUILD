# Maintainer: taotieren <admin@taotieren.com>
_pkgname=SerialTool
pkgname=serialtool-git
pkgver=v1.5.5.r0.ge7c9f72
pkgrel=2
pkgdesc="A practical Serial-Port/TCP/UDP debugging tool."
arch=('any')
url="https://github.com/HoGC/SerialTool"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname} 'serialtool')
#replaces=(${pkgname})
depends=('qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script' 'icoutils')
makedepends=('git' 'qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script' 'qt5-tools')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${_pkgname}::git+https://github.com/HoGC/${_pkgname}.git"
        "${pkgname}.install")
sha256sums=('SKIP'
            '303f34246c0d341e1093d6e486e2cbfdbbb0d122d751de649f562ebac37777b4')

pkgver() {
    cd "${srcdir}/${_pkgname}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${_pkgname}/${_pkgname}/
    qmake ${_pkgname}.pro
    make
}

package() {
    install -dm755 "${pkgdir}/usr/bin/" \
                   "${pkgdir}/usr/share/${pkgname%-git}/"

    cd ${srcdir}/${_pkgname}/${_pkgname}/
    cp --preserve=mode -r ${_pkgname} language config themes slave  "${pkgdir}/usr/share/${pkgname%-git}/"

    cd pkg/
    cp --preserve=mode -r icons "${pkgdir}/usr/share/"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" << EOF
#!/bin/env bash

cd /usr/share/${pkgname%-git}
./${_pkgname}
EOF
    install -Dm0644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm0644 "${srcdir}/${_pkgname}/${_pkgname}/pkg/io.github.skiars.${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/io.github.skiars.${pkgname%-git}.desktop"
    install -Dm0644 "${srcdir}/${_pkgname}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
    install -Dm0644 "${srcdir}/${_pkgname}/${_pkgname}/pkg/io.github.skiars.${pkgname%-git}.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.skiars.${pkgname%-git}.metainfo.xml"
}
