# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-web-server-bin
_pkgname=Simple-Web-Server
pkgver=1.2.17
_electronversion=38
pkgrel=1
pkgdesc="Create a local web server in just a few clicks with an easy to use interface. A continuation of Web Server for Chrome, built with Electron.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://simplewebserver.org/"
_ghurl="https://github.com/terreng/simple-web-server"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rdebpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Linux-${pkgver}-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/terreng/simple-web-server/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('57e19cef8140644e1f4ac091f5bb90dc20e65f26232a756233cba336c2dbd85b'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('7cb409ad22cf74c31fee737e7c04a5194873b05deb9e886d9d3c90b9e3a50e70')
sha256sums_x86_64=('6a39be7f723f4305bab5aa8b60dd2a5372939b85aa46db2bf10366e02de71411')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname//-/ }/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname//-/ }/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
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