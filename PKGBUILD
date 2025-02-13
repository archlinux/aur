# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=crossy
pkgname="${_appname}-clipboard-bin"
_pkgname=Crossy.Clipboard
pkgver=1.4.2
_electronversion=34
pkgrel=1
pkgdesc="Cross-platform clipboard synchronization application.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/Crossy-Clipboard/crossy-electron"
license=('ISC')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}.Setup.${pkgver}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('e7c1add4facd225bb739f1c218c22426b1c0760854e8d7de93b733bdcb1a4035'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}-electron/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/\/opt\/${_pkgname}\/${_appname}-electron/${pkgname%-bin}/g
        s/Icon=${_appname}-electron/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_appname}-electron.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/2000x2000/apps/${_appname}-electron.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}-electron.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}