# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=dnschanger
pkgname="${_appname}-desktop-bin"
_pkgname=DNS-Changer
pkgver=2.2.0
_electronversion=29
pkgrel=1
pkgdesc="Gather the best DNS servers in a secure application."
arch=("x86_64")
url="https://dnschanger.github.io/"
_ghurl="https://github.com/DnsChanger/dnsChanger-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/DnsChanger/dnsChanger-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('8617820b4aea8d534284ac38a66e4adffef71539fdaddca5da2bbd402c5fa129'
            'd8cd7d03b1c407ad97d6059dd8d6821ce42ab3bd8e9d39caab2fe4e730c8f737'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname//-/ }/${_appname}|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g;s|Utilities|Utility|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}