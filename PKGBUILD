# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kaas-bin
_pkgname=Kaas
pkgver=1.0.9
pkgrel=1
pkgdesc="Cross-platform desktop LLM client for OpenAI ChatGPT, Anthropic Claude, Microsoft Azure and more, with a focus on privacy and security."
arch=("x86_64")
url="https://github.com/0xfrankz/Kaas"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgname%-bin}-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/0xfrankz/Kaas/${pkgname%-bin}-v${pkgver}/LICENSE"
)
sha256sums=('df151ecb7b9a293802ebcc11590b0ac441cf09dd23844c9d455e93ca659ddd55'
            '92369ee89bbdda6b7d05ad8667c9b354ede5d80e2e9ebb2aca2bbb9f156b44e1')
prepare() {
    sed -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/"* -t "${pkgdir}/usr/lib/${_pkgname}/resources"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
