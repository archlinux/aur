# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chieapp-bin
_pkgname=Chie
pkgver=0.2.11
pkgrel=8
pkgdesc="An extensible desktop app for large language models like ChatGPT and Bing Chat.(Prebuilt version)"
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
            'd51d809af628cc8292bd430a4847adb4adefa9d4b0aee00a55a84ff9630e167c')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/res" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/res/assets/icons/icon@2x.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}