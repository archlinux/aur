# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=cozy_overlay_desktop
pkgname="${_appname//_/-}-bin"
_pkgname='Cozy Overlay'
pkgver=0.1
_electronversion=33
pkgrel=2
pkgdesc="An ambient cozy animation overlay on your desktop.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/puff-dayo/cozydeco-overlay"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}-linux-x64-v${pkgver}.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/puff-dayo/cozydeco-overlay/v${pkgver}/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('afa7eb9efbb1eb4410100034cbb51290cb80de7172e901a3f495e9c3141cc4fe'
            '315a5a8d0c0e4e0d7d43faa3a21175efa835c72f91f5afa30bcb0177e3f87890'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app.asar" -t  "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}