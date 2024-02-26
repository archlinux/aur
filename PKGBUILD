# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatd-bin
pkgver=1.1.0
_electronversion=24
pkgrel=2
pkgdesc="Chat with your documents using local AI"
arch=('x86_64')
url="https://chatd.ai/"
_ghurl="https://github.com/BruceMacD/chatd"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'python>=3'
    'ollama'
    'nodejs'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/BruceMacD/chatd/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('0c2879ae40b1c17ce81bb90eec7e281018736c6aad0574aabb4c025a92418687'
            '2482d360377c8e4d4ef1432e93f9e67e6f6d76ce0e69eee6f2647c3f1c296dd2'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/app/src/service/ollama/runners"
    cp -r "${srcdir}/out/${pkgname%-bin}-linux-x64/resources/app/"* "${pkgdir}/usr/lib/${pkgname%-bin}/app"
    ln -sf "/usr/bin/ollama" "${pkgdir}/usr/lib/${pkgname%-bin}/app/src/service/ollama/runners/ollama-linux"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/out/${pkgname%-bin}-linux-x64/resources/app/public/${pkgname%-bin}.iconset/icon_${_icons}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644  "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}