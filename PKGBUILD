# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=password-strength-checker-bin
_pkgname="Password Strength Checker"
pkgver=2.3.0
_subver=Rel16032024-1000ist
_electronversion=29
pkgrel=2
pkgdesc="Password Strength Measuring or checking application."
arch=(
    'x86_64'
)
url="https://github.com/ArchismanKarmakar/Password-Strength-Check-ElectronJS-CPP"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}${_subver}/${pkgname%-bin}-using-electronjs-cpp_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('f73b8d74f3de7022b662ceccc05b1783e93d5ddfa172ef1e0d4abcf157b34c89'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}-using-electronjs-cpp|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|\"/opt\/${_pkgname}\/${pkgname%-bin}-using-electronjs-cpp\"|${pkgname%-bin}|g" \
        -e "s|Icon=${pkgname%-bin}-using-electronjs-cpp|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}-using-electronjs-cpp.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-using-electronjs-cpp.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}-using-electronjs-cpp.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}