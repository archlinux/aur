# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cribarth-music-player-bin
_pkgname='Cribarth Music Player'
pkgver=1.1.8
_electronversion=29
pkgrel=1
pkgdesc='A lightweight Electron wrapper for Home Assistant`s Music Assistant "This Device" player.(Prebuilt version.Use system-wide electron)'
arch=('x86_64')
url="https://github.com/glanyrafon01/cribarth-music-player"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('516c48f9453c1253e94d5e402c677c1a5effdaa070195db06581b457d5f71eb5'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname// /-}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    # Add icons
    asar e "${srcdir}/opt/${_pkgname// /-}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i "/height: 700,/a\    icon: path.join(__dirname, 'logo.png')," "${srcdir}/app.asar.unpacked/main.js"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/32x32/apps/${pkgname%-bin}.png" "${srcdir}/app.asar.unpacked/logo.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${_pkgname// /-}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}