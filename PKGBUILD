# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=translationcore-bin
_pkgname=translationCore
pkgver=3.6.2
pkgrel=1
pkgdesc="An open source platform for checking and managing Bible translation projects"
arch=('aarch64' 'x86_64')
url="https://www.translationcore.com/"
_githuburl="https://github.com/unfoldingWord/translationCore"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron25'
    'hicolor-icon-theme'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/tC-linux-arm64-${pkgver}-MAX-d1f76d8.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/tC-linux-x64-${pkgver}-MAX-d1f76d8.deb")
source=(
    "LICENSE::https://raw.githubusercontent.com/unfoldingWord/translationCore/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a756bd73c46e3e9b85ff0222658f4c63851ebc5af63811adc4333ff618688417'
            'b5b7830edb74de9b8d10f7216947fd9ed62ac39d9287db3e71757a63fbda64ef')
sha256sums_aarch64=('4bd8a2ed2a6e669be107f64137bf085292659672d3e688f65801e747979a9fc3')
sha256sums_x86_64=('aa7ddffd5769f02270dc55f332bfd606823395176a3de63bb4d6c83dc952f39b')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/opt/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
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
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}