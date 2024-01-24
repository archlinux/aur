# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine-canary-bin
_pkgname=AFFiNE-canary
pkgver=0.11.3_canary.6
_electronversion=28
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use.Beta Version."
arch=('x86_64')
url="https://affine.pro/"
_ghurl="https://github.com/toeverything/AFFiNE"
license=('MPL-2.0')
provides=("${pkgname%-canary-bin}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-canary-bin}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-x64.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver//_/-}/packages/frontend/core/public/favicon-192.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('34e7e1d7396d86d2e400f97406d6d77496452cffa50bf8c132567b863333bb0d'
            'b54bb7aa14dd5725bc268921eeea9dee973dacbc13e0cea30e7d2adb5cd5a53f'
            'b266795bb7f2dd32b76ef8f05788bbd63da556629265cca13217167cfc4d9cde'
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
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}-linux-x64/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}