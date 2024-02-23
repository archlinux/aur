# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine-canary-bin
_pkgname=AFFiNE-canary
pkgver=0.13.0_canary.0
_electronversion=29
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use.Beta Version."
arch=('x86_64')
url="https://affine.pro/"
_ghurl="https://github.com/toeverything/AFFiNE"
license=('LicenseRef-custom')
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
sha256sums=('fc2e88455d01d62bef5517818c047e424799340fcb7cf5a593d8b1e1da411e50'
            'b67790c8940fae72af15fdaf105f051123eb9598291ca4f0079aa47615e62d85'
            'b266795bb7f2dd32b76ef8f05788bbd63da556629265cca13217167cfc4d9cde'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}-linux-x64/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}