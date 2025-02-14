# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=rem
pkgname=${_appname}-player-bin
_pkgname=REM
pkgver=0.2.4
_electronversion=33
pkgrel=2
pkgdesc="Network music player based on netease music api.(Prebuild version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/reallyGoodBaker/REM"
license=('GPL-2.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('85f1c70385489f7c78f0949e3330325995d485b0188c146d576627f53cc786e6'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\/opt\/${_appname}\/${_appname}/${pkgname%-bin}/g
        /Comment/d
        8i\Comment=${pkgdesc}
        s/Utility/AudioVideo/g
        s/Icon\=${_appname}/Icon\=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}