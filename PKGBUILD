# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=macchatgpt
_pkgname=MacChatGPT
pkgver=1.0.0
pkgrel=2
pkgdesc="A macOS, Windows and Linux desktop application which runs ChatGPT easily and free of charge."
arch=('x86_64')
url="https://github.com/justinhartman/MacChatGPT"
license=("custom")
conflicts=("${pkgname}")
depends=('bash' 'electron23')
makedepends=('gendesk' 'npm' 'nodejs')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('7b464dfdc568d29aaf55e897b768e6134aae16fe38bd3c4443b44668fbe849c4'
            'b74b6d51eb9e5b57175157fc126a4fb0c91bc7191a0d92056e86f789f8c663c3')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run package:linux:x64
    asar pack "${srcdir}/${_pkgname}-${pkgver}/dist/build/${_pkgname}-linux-x64/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/icons/png/512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/build/${_pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}