# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=translationcore-bin
_pkgname=translationCore
pkgver=3.6.4
_subver=MAX-ee24062
_electronversion=25
pkgrel=1
pkgdesc="An open source platform for checking and managing Bible translation projects"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.translationcore.com/"
_ghurl="https://github.com/unfoldingWord/translationCore"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/tC-linux-arm64-${pkgver}-${_subver}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/tC-linux-x64-${pkgver}-${_subver}.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/unfoldingWord/translationCore/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a756bd73c46e3e9b85ff0222658f4c63851ebc5af63811adc4333ff618688417'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('cae82c2c9e7f890524f30dab9c7d427761e8e1ce481d94cf8710b79f69d08446')
sha256sums_x86_64=('089cc504ad0eecd938e74a4cdf2dc66d0390ee48a2d8135d47beeb250cd990cd')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
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