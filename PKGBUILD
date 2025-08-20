# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=todoist-wrapper-bin
_pkgname=Todoist
pkgver=4.20250820015404
_electronversion=37
pkgrel=1
pkgdesc="Electron Wrapper for Todoist on Linux.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/conjfrnk/todoist-wrapper"
license=('GPL-3.0-only')
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
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}-logo.zip::https://doist.com/brand-assets/todoist-logo.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('32e3e47f520be81bb36ed496d6b94c2da9c35ac3245b8ba0e87e4831fcdad821'
            'b0ac98d0108e481f0717413ec594ea09f654eede762d4b0425d0974d0b2bec6a'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/bin/${pkgname%-bin}-linux-x64/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
    _get_electron_version
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/bin/${pkgname%-bin}-linux-x64/resources/app"  "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/Icon/Color.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/bin/${pkgname%-bin}-linux-x64/resources/app/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
