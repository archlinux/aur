# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godmode
_pkgname=GodMode
_oldname=smolmenubar
pkgver=0.0.17
pkgrel=1
pkgdesc="AI Chat Browser: Fast, Full webapp access to ChatGPT / Claude / Bard / Bing / Llama2!"
arch=('any')
url="https://smol.ai/"
_githuburl="https://github.com/smol-ai/GodMode"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22' 'hicolor-icon-theme')
makedepends=('npm' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('0b5a96a5a40707bdfc59f9867f884347dcf70ce65b3618ebe75ee934f92f6ee1'
            '28342580b235097d30c799f449000005ab88b7128fdd6d19b4a7a262610e11cf')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed "s|${_oldname}|${pkgname}|g" -i package.json
    sed "s|${_oldname}|${pkgname}|g" -i forge.config.js
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    local aarch64=arm64 x86_64=x64
    asar pack "${srcdir}/${_pkgname}-${pkgver}/out/${pkgname}-linux-${CARCH}/resources/app"  "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/images/smol_chicken.svg" "${pkgdir}/usr/share/icons/hicolor/saclable/apps/${pkgname}.svg"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${_pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}