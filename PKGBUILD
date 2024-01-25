# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lumen-bin
_pkgname=Project.L.U.M.E.N.
pkgver=1.2.2
_electronversion=25
pkgrel=6
pkgdesc="A simple and modulable personal assistant built on Electron."
arch=('x86_64')
url="https://github.com/L-U-M-E-N/lumen-desktop"
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
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}.sh"
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
sha256sums=('37e1d2848757207cf3bb29fe43fe63e1791e31211eb9f5f1a209828653818843'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}/random-names.txt" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}/resources/app/img/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}