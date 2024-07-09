# Maintainer: Anton Reshetov
pkgname=masscode-bin
_pkgname=massCode
pkgver=3.11.0
_electronversion=16
pkgrel=4
pkgdesc="A free and open source code snippets manager for developers"
arch=('x86_64')
url="https://masscode.io/"
_ghurl="https://github.com/massCodeIO/massCode"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'squashfs-tools'
)
source=(
    "${pkgname%-bin}-${pkgver}.snap::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.snap"
    "${pkgname%-bin}.sh"
)
sha256sums=('72df12e9b5a5a7afef0d31c75f5c56994bbbe3bd8c2c87b5dee9baa919a9591f'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    unsquashfs -f "${srcdir}/${pkgname%-bin}-${pkgver}.snap"
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}