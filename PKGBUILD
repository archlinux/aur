# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-web-server-bin
_pkgname=Simple-Web-Server
pkgver=1.2.11
_electronversion=28
pkgrel=1
pkgdesc="Create a local web server in just a few clicks with an easy to use interface. A continuation of Web Server for Chrome, built with Electron."
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Linux-${pkgver}-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/terreng/simple-web-server/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('57e19cef8140644e1f4ac091f5bb90dc20e65f26232a756233cba336c2dbd85b'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('bde9d3f38ee0544eb467edd57b467c842a20b63b8a905ba7ba06a4f0634d547a')
sha256sums_x86_64=('5400668727aec4701097929db27a330a89c57fec5404903e0fc9e0f894cc5470')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname//-/ }|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname//-/ }/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}