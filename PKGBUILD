# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=sharefi
pkgname="${_pkgname}-electron-bin"
pkgver=0.5.0
_electronversion=24
pkgrel=1
pkgdesc="The sharefi app allows you to share files and folders through local network. It is fast, secure, free, easy to use and cross platform."
arch=("x86_64")
url="https://sharefi.app"
_ghurl="https://github.com/lucafornerone/sharefi-electron"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    "electron${_electronversion}"
    'wireless_tools'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/download/v${pkgver}/linux/${_pkgname}-x64-v${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lucafornerone/sharefi-electron/release/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ba342b1a4677beb32b9fe2039ee8207eba1b038a76e3fb13bcedd477a6ebeaf4'
            '3355028d7d3f5a0da30ca17099cf8f9a6c833986cbad09ce930901b3379eb0fd'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}