# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=betterx-desktop-bin
_pkgname='BetterX Desktop'
pkgver=2.0
_electronversion=34
pkgrel=1
pkgdesc="Desktop application for BetterX, enhancing your X-perience.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://feur-inc.github.io/BetterX-Website/"
_ghurl="https://github.com/Feur-Inc/BetterX-Desktop"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}.0-beta_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('c0c1174c0378882c87691c54c1ca709d423c0095be4e54b7e54248a5789e652f'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
        s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/Entertainment/Network/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}