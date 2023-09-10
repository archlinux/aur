# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alpaca-electron-bin
_appname="Alpaca Electron"
pkgver=1.0.5
pkgrel=4
pkgdesc="The simplest way to run Alpaca (and other LLaMA-based local LLMs) on your own computer"
arch=(x86_64)
url="https://github.com/ItsPi3141/alpaca-electron"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13' 'hicolor-icon-theme')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.bin::${url}/releases/download/v${pkgver}/${_appname// /-}-linux-x64-v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('f77cbb049b831a89be19ddc4b7334d3d5ad7779649d4f8410ba00c70a740f912'
            '200ad575e63583389e8a9a944ae29f2c9cdb92fed061d60771f03bbfee10a9c1')
prepare() {
    asar pack "${srcdir}/release-builds/${_appname}-linux-x64/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/release-builds/${_appname}-linux-x64/resources/app/icon/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/release-builds/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}