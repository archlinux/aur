# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nxshell-bin
_pkgname=NxShell
pkgver=1.9.6
_electronversion=17
pkgrel=2
pkgdesc="An easy to use new terminal."
arch=('x86_64')
url="https://nxshell.github.io/"
_githuburl="https://github.com/nxshell/nxshell"
_downurl="http://106.15.238.81:52081/github"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
    'nodejs'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}/${_pkgname}-amd64-linux-${pkgver}-202306300440.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/nxshell/nxshell/main/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('85ce9e3f019f655b929825826dc3b85703bda77acae45169a2c8cf53e5cded52'
            '5f6da76746b239458fc480805f2e761e4d95b023169b99bb2c333e5bbc125fb7'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -e "s|apps|..\/..\/${pkgname%-bin}/apps|g" \
        -e "s|${pkgname%-bin}.png|..\/..\/${pkgname%-bin}/${pkgname%-bin}.png|g" \
        -i "${srcdir}/app.asar.unpacked/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/${pkgname%-bin}.png" "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/"{apps,node_modules} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}