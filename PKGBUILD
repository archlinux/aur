# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chrolog-bin
_pkgname=Chrolog
pkgver=1.8.3
_electronversion=28
pkgrel=5
pkgdesc="An automated time tracking tool"
arch=("x86_64")
url="https://github.com/Lukylix/Chrolog"
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
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Lukylix/Chrolog/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('190e86b4111454ee4f524f68a585727d1ce60ef961e35a67deeb72c35e5960fb'
            '2cbf73c5824da32f1f9d2db0fb78368b0c556cf80a2de0fd569aa9722dae14ee'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/linux-unpacked/resources/"{app.asar.unpacked,resources} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/linux-unpacked/resources/resources/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}