# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chieapp-bin
_pkgname=Chie
pkgver=0.2.11
pkgrel=6
pkgdesc="An extensible desktop app for large language models like ChatGPT and Bing Chat."
arch=('x86_64')
url="https://chie.app/"
_ghurl="https://github.com/chieapp/chie"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'gtk3'
    'webkit2gtk'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-x64.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('4b4271be8438312e3aedc5ca5c9c2f82e406a194df8dfa8c6d4ecfbaca0fe88d'
            '6c6b87b5416a785adc4f4998d35629ae7304222f754c9bfdd717fa9f8d94ed8a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/res" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/res/assets/icons/icon@2x.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}