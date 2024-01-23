# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=primate-bin
_pkgname=Primate
pkgver=1.1.0
_electronversion=22
pkgrel=4
pkgdesc="A modern dashboard for Kong Gateway admins"
arch=('x86_64')
url="https://www.getprimate.xyz/"
_ghurl="https://github.com/getprimate/primate"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x64.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/getprimate/primate/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ce23dc5a2e5373b16167817c1f588cee8a6a05c9b02b449e58682821f9e63b55'
            'dd4c137b56da1d126c2aa91b11250f4b1c2973f4dec7f44ce904359bbb1d5612'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}-v${pkgver}-x64/resources/"{icons,themes} "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-x64/resources/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}