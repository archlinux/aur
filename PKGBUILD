# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=sharefi
pkgname="${_pkgname}-electron-bin"
pkgver=0.5.0
_electronversion=24
pkgrel=2
pkgdesc="Share files and folders through local network. It is fast, secure, free, easy to use.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://sharefi.app"
_ghurl="https://github.com/lucafornerone/sharefi-electron"
license=('MIT')
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
    "${pkgname%-bin}-${pkgver}.rpm::${url}/download/v${pkgver}/linux/${_pkgname}-${CARCH}-v${pkgver}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lucafornerone/sharefi-electron/release/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('6c0f527bd8968bf71a78e4785e2b58986fa79ee9c57c59cd53196fd8faeab5e3'
            '3355028d7d3f5a0da30ca17099cf8f9a6c833986cbad09ce930901b3379eb0fd'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}