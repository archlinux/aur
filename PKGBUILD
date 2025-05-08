# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=station-bin
_pkgname=Station
pkgver=3.3.0
_electronversion=27
pkgrel=2
pkgdesc="The first open-source smart browser for busy people. A single place for all of your web applications.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://getstation.com/"
_ghurl="https://github.com/getstation/desktop-app"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('c9c41f29ba3b12b3db7a5fd0eaa1c33c20ec8b08c30b8b876c3f51a54e53f842'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}v2/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${_pkgname}\/${pkgname%-bin}-desktop-app/${pkgname%-bin}/g
        s/${pkgname%-bin}-desktop-app/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-desktop-app.desktop"
    find "${srcdir}/opt/${_pkgname}/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,.env.production,app-update.yml,icon-app.png} \
        "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-desktop-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-desktop-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}