# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=translationcore-bin
_pkgname=translationCore
pkgver=3.6.2
_electronversion=25
pkgrel=3
pkgdesc="An open source platform for checking and managing Bible translation projects"
arch=('aarch64' 'x86_64')
url="https://www.translationcore.com/"
_ghurl="https://github.com/unfoldingWord/translationCore"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/tC-linux-arm64-${pkgver}-MAX-d1f76d8.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/tC-linux-x64-${pkgver}-MAX-d1f76d8.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/unfoldingWord/translationCore/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a756bd73c46e3e9b85ff0222658f4c63851ebc5af63811adc4333ff618688417'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
sha256sums_aarch64=('4bd8a2ed2a6e669be107f64137bf085292659672d3e688f65801e747979a9fc3')
sha256sums_x86_64=('aa7ddffd5769f02270dc55f332bfd606823395176a3de63bb4d6c83dc952f39b')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${_pkgname}|${pkgname%-bin}|g;s|unfoldingword-${pkgname%-bin}|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/${pkgname%-bin}/unfoldingword-${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/unfoldingword-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16 22 32 48 64 128;do
        install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}-${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}