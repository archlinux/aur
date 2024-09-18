# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=atlasify-bin
_pkgname=Atlasify
pkgver=0.2.0
_electronversion=32
pkgrel=1
pkgdesc="Atlassian notifications on your menu bar."
arch=('x86_64')
url="https://atlasify.io/"
_ghurl="https://github.com/setchy/atlasify"
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
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/setchy/atlasify/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('0dfdc7730abedf9d79a62d5d386f97da9942ccffab9620b486ab8ca23aa9246e'
            '8f2d641cd26495f3e20d1e09b49e47eb022b94b3a68c6944144aadccb6f123e2'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/;s/Productivity/Productivity;Utility/" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    for _icon_sizes in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icon_sizes}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icon_sizes}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}