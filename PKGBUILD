# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>
pkgname=singland-bin
_pkgname=Singland
pkgver=pre_alpha_4
_electronversion=23
pkgrel=5
pkgdesc="A GUI for sing-box.The universal proxy platform.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
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
    "${pkgname%-bin}-${pkgver}.rpm::https://github.com/net-breaker/sing-land/releases/download/${pkgver//_/-}/${pkgname%-bin}-alpha-linux-amd64.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/net-breaker/sing-land/${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b7fd155a6a8f71d42d220f8d51493e0cb1c6461fc0f706f42e14391a356f666f'
            '98137f871b486ba3e608ca184e98c22adc6f928521e70dc3f6d21b234252927d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/"{config,icons,sing-box} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}