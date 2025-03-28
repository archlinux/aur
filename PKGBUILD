# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=todoist-wrapper-bin
_pkgname=Todoist
pkgver=4.20250328014757
_electronversion=35
pkgrel=1
pkgdesc="Electron Wrapper for Todoist on Linux.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/conjfrnk/todoist-wrapper"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
    'icoutils'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}.ico::https://todoist.com/static/favicon.ico"
    "${pkgname%-bin}.sh"
)
sha256sums=('fc59949e44d9c64c31bb5d71cb41e2f0a73af380ea83d0b9decf04292d11c950'
            'b2e0854d044a1ed01b395ea582eb86b675aecbbfd6cbceec0e40b73966a222d0'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    icotool -x "${srcdir}/${pkgname%-bin}.ico" -o "${srcdir}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/bin/${pkgname%-bin}-linux-x64/resources/app"  "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-bin}"_*_"${_icons}"x32.png \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/bin/${pkgname%-bin}-linux-x64/resources/app/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}