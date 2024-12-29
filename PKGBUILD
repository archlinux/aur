# Maintainer: taotieren <admin@taotieren.com>
_pkgname=SerialTool
pkgname=serialtool-git
pkgver=1.4.0alpha.r28.g6f14442
pkgrel=1
pkgdesc="A practical Serial-Port/TCP/UDP debugging tool."
arch=($CARCH)
url="https://github.com/skiars/SerialTool"
license=('GPL-3.0-or-later')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=('qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script' 'icoutils')
makedepends=('git' 'qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script' 'qt5-tools')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${_pkgname}::git+${url}.git"
    "${pkgname}.install")
sha256sums=('SKIP'
    '303f34246c0d341e1093d6e486e2cbfdbbb0d122d751de649f562ebac37777b4')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${_pkgname}" clean -dfx
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
    cp --preserve=mode -r ${_pkgname} language config themes slave "${pkgdir}/usr/share/${pkgname%-git}/"

    cd pkg/
    cp --preserve=mode -r icons "${pkgdir}/usr/share/"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
#!/bin/env bash

cd /usr/share/${pkgname%-git}
./${_pkgname}
EOF
    install -Dm0644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm0644 "${srcdir}/${_pkgname}/${_pkgname}/pkg/io.github.skiars.${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/io.github.skiars.${pkgname%-git}.desktop"
    install -Dm0644 "${srcdir}/${_pkgname}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
    install -Dm0644 "${srcdir}/${_pkgname}/${_pkgname}/pkg/io.github.skiars.${pkgname%-git}.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.skiars.${pkgname%-git}.metainfo.xml"
}
