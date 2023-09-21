# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ytdownloader-gui-bin
_pkgname=YTDownloader
pkgver=3.14.2
pkgrel=2
pkgdesc="A modern GUI App for downloading Videos and Audios from hundreds of sites."
arch=('x86_64')
url="https://ytdn.netlify.app/"
_githuburl="https://github.com/aandrew-me/ytDownloader"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.rpm::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_Linux.rpm"
    "${pkgname%-bin}.sh")
sha256sums=('d62b904925998f3d5748c5781b335b9ae3834b44f9a680975b01cc0b7f014a88'
            '402e3654ac6b89dfcbabeba6e5d3736f374860476efce810f1789b7caf8ec271')
build() {
    asar pack "${srcdir}/opt/${_pkgname}/resources/app" "${srcdir}/app.asar"
    sed "s|/opt/${_pkgname}/${pkgname%-gui-bin} %U|${pkgname%-bin}|g;s|Icon=${pkgname%-gui-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-gui-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-gui-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 64x64 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-gui-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}