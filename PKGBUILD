# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chrolog-bin
_pkgname=Chrolog
pkgver=1.8.0
_electronversion=28
pkgrel=1
pkgdesc="An automated time tracking tool"
arch=("x86_64")
url="https://github.com/Lukylix/Chrolog"
license=('LicenseRef-FOSS')
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
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('01f4254d4c9bcd81850846fafbaadfc107732d2aaad4285cbaae73a29990a740'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/linux-unpacked/resources/"{app.asar.unpacked,resources} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/linux-unpacked/resources/resources/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}