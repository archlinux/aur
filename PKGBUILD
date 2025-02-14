# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ringcentral-community-app-bin
_pkgname="RingCentral (Community) app"
pkgver=0.0.12
_electronversion=27
pkgrel=2
pkgdesc="RingCentral Community client for Linux using Electron.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/ringcentral/ringcentral-community-app"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ringcentral/ringcentral-community-app/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a116b3b176c61de449d761f1e9cc2abb06bb814767153131b3496795b2b4f7a1'
            '4e8d7961707e7a474b7ee30b65f9e967a22a9566d440774b86a7d83c55108228'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\" --no-sandbox/${pkgname%-bin}/g
        s/Telephony/Telephony;Network/g
    " -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}