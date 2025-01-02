# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=falkor-bin
_pkgname=Falkor
pkgver=0.0.92
_electronversion=33
pkgrel=1
pkgdesc="Dive into Falkor, where you'll discover a vast selection of games coupled with community-driven enhancements. Experience seamless and secure gaming within a single, universal hub.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://falkor.moe"
_ghurl="https://github.com/Team-Falkor/falkor"
license=('MIT')
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}.pacman"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Team-Falkor/falkor/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('85fd3e8f416d1a89368e37853e9d90e57aa98af42369896371f61407c06fa2ef'
            'd366fe7f83cb9e5a7d18a6f803aca13cc4e6b96c70bf5702236019e99d4d16c4'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}