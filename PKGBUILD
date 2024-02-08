# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=localchat-bin
pkgver=0.8.0
_electronversion=28
pkgrel=1
pkgdesc="Chat with generative language models locally on your computer with zero setup. "
arch=(
    'aarch64'
    'x86_64'
)
url="https://nathanlesage.github.io/local-chat/"
_ghurl="https://github.com/nathanlesage/local-chat"
license=("GPL-3.0-only")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
sha256sums_aarch64=('c67445a3afb9bb192b9b58f2890dbf60c4f0a113a901c126489327600ededf4d')
sha256sums_x86_64=('8ebfb42c5403743ae43d918bdd5da7eab572c6f16c90419620edb0b0f73781cb')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|(!a.app.isPackaged){const|(a.app.isPackaged){const|g" -i "${srcdir}/app.asar.unpacked/.webpack/main/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}