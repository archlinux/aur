# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-web-server-bin
_pkgname=Simple-Web-Server
pkgver=1.2.14
_electronversion=33
pkgrel=1
pkgdesc="Create a local web server in just a few clicks with an easy to use interface. A continuation of Web Server for Chrome, built with Electron.(Prebuilt version.Use system-wide electron)"
arch=(
    "aarch64"
    "x86_64"
)
url="https://simplewebserver.org/"
_ghurl="https://github.com/terreng/simple-web-server"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Linux-${pkgver}-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Linux-${pkgver}-x86_64.rpm")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/terreng/simple-web-server/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('57e19cef8140644e1f4ac091f5bb90dc20e65f26232a756233cba336c2dbd85b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('da203ce90159e43baf318cf377ef4e426e294d9b9dbf3c62554f8c376f610494')
sha256sums_x86_64=('087d5223b1cc294e6518ee60d3c7ce80220829deac77abac5b649172f9a3c5e5')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname//-/ }/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\"\/opt\/${_pkgname//-/ }\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar.unpacked" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
