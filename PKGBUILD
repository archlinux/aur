# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wai-chat-desktop
_appname="Wai Chat"
pkgver=1.1.2
pkgrel=2
pkgdesc="An electron project for chatgpt wai chat bot"
arch=('any')
url="https://github.com/ptp-build/wai-chat-desktop"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron24' 'hicolor-icon-theme')
makedepends=('npm>=9' 'gendesk' 'asar' 'nodejs>=14')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('7f69542f9d0fccf9e2cd26ed495580731fbc9a45658576ab8c65a9c0537c89ab'
            '350ca6579a96f3ebb1ff9225a2af1096d8208dd4f9949e034ac5fd91861165aa')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    asar pack "${srcdir}/${pkgname}-${pkgver}/out/${_appname}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/icons/favicon.${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}