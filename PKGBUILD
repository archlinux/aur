# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=llocal-bin
_pkgname=LLocal
pkgver=1.0.0_beta.5
_electronversion=28
pkgrel=1
pkgdesc="Aiming to provide a seamless and privacy driven chatting experience with open-sourced technologies(Ollama), particularly open sourced LLM's(eg. Llama3, Phi-3, Mistral). Focused on ease of use."
arch=("x86_64")
url="https://www.llocal.in/"
_ghurl="https://github.com/kartikm7/llocal"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'ollama'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kartikm7/llocal/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('e8a389018e933a63f46b4b5d3e9d9bfa09b436efba4f7528428526b8c4e4ef3a'
            '4b67dc8b6237614c0a113c4436ffe6c972dbdfae6ba0de0d9149c7dc5a887869'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/resources/icon.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}