# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alpaca-electron-bin
_appname="Alpaca Electron"
pkgver=1.0.5
pkgrel=3
pkgdesc="The simplest way to run Alpaca (and other LLaMA-based local LLMs) on your own computer"
arch=(x86_64)
url="https://github.com/ItsPi3141/alpaca-electron"
license=('MIT')
depends=('bash' 'electron13' 'hicolor-icon-theme')
makedepends=('asar' 'gendesk')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.bin::${url}/releases/download/v${pkgver}/${_appname// /-}-linux-x64-v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('f77cbb049b831a89be19ddc4b7334d3d5ad7779649d4f8410ba00c70a740f912'
            '200ad575e63583389e8a9a944ae29f2c9cdb92fed061d60771f03bbfee10a9c1')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/release-builds/${_appname}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 24x24 32x32 48x48 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/release-builds/${_appname}-linux-x64/resources/app/icon/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/release-builds/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}