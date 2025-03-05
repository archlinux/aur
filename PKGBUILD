# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatd-bin
pkgver=1.1.1
_electronversion=24
pkgrel=2
pkgdesc="Chat with your documents using local AI.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://chatd.ai/"
_ghurl="https://github.com/BruceMacD/chatd"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
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
sha256sums=('c91afeade68061f1f84b3a9733098831e759111d4a24d04b9dc0f772102e3df7'
            '2482d360377c8e4d4ef1432e93f9e67e6f6d76ce0e69eee6f2647c3f1c296dd2'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/app/src/service/ollama/runners"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/"* "${pkgdir}/usr/lib/${pkgname%-bin}/app"
    ln -sf "/usr/bin/ollama" "${pkgdir}/usr/lib/${pkgname%-bin}/app/src/service/ollama/runners/ollama-linux"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
      install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/public/${pkgname%-bin}.iconset/icon_${_icons}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644  "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}