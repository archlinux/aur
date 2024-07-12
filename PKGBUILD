# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>
pkgname=singland-bin
_pkgname=Singland
pkgver=pre_alpha_4
_electronversion=23
pkgrel=4
pkgdesc="A GUI for sing-box. The universal proxy platform"
arch=("x86_64")
url="https://github.com/net-breaker/sing-land"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
makedepends=(
    'gendesk'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/net-breaker/sing-land/releases/download/${pkgver//_/-}/singland-alpha-linux-amd64.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/net-breaker/sing-land/${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('fb09e9be944c7237d9311b23206dd0e2e88b36462db76188ee6737c47b995b9e'
            '98137f871b486ba3e608ca184e98c22adc6f928521e70dc3f6d21b234252927d'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
    asar e "${srcdir}/${pkgname%-bin}-0.0.4/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" -i "${srcdir}/app.asar.unpacked/main.js"
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" -i "${srcdir}/app.asar.unpacked/controller.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-0.0.4/resources/"{config,icons,sing-box} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for _icons in 32 256 512;do
        install -Dm644 "${srcdir}/${pkgname%-bin}-0.0.4/resources/icons/logo-${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}