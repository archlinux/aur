# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gopher-bin
_pkgname=Gopher
pkgver=1
_electronversion=2
pkgrel=4
pkgdesc="Cross-Platform Desktop Password Manager"
arch=('x86_64')
url="https://github.com/HusnainTaj/Gopher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/HusnainTaj/Gopher/v${pkgver}/icons/png/512x512.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/HusnainTaj/Gopher/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('3d1ada1614d852f49d3606faa95eb4425829693cefa738bf2359b2a86ccacb95'
            'a48a85aa1cf632a0e34abe0696865e1a379bcbd6878a9e10bedd400e1ec2a90f'
            'cd28f93efae53392db346b89ea3a61c8cbad465c20cfb1083e827cfff8e62090'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}