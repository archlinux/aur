# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=snowflake_desktop
pkgname="${_appname//_/-}-bin"
_pkgname='Snowflake Desktop'
pkgver=2024.12
_electronversion=33
pkgrel=2
pkgdesc="A simple electron app that creates a cozy snowfall overlay on your desktop, adding a touch of winter wonder to your workspace.❄️(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/puff-dayo/Snowflake-Desktop"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/${_appname}-linux-x64-portable.tar.zst"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/puff-dayo/Snowflake-Desktop/v${pkgver}/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('382c94c28d56b623dd9ecd955168580160d35587ca4dc0886c7d479aafc4ac81'
            'a59724d625aadd7c619d70c3f68a7a1202758be4ef77714badb9924d0c9f18c0'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}