# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bcrypt-sandbox-bin
_pkgname="Bcrypt Sandbox"
pkgver=1.0.0
pkgrel=9
pkgdesc="A tool for encrypting and validating text with bcrypt.(Prebuilt version)"
arch=('x86_64')
url="https://felladrin.github.io/bcrypt-sandbox"
_ghurl="https://github.com/felladrin/bcrypt-sandbox"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/felladrin/bcrypt-sandbox/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9b1675cb7f13d3bfa2ade85fd0821c42d106d23b7e7b66e8682dc256a5a0b61d'
            '9fefa7c0ffe3e72fa6f422498c7a892ba6ef9360e84f3892448c2ebe9d04ba70'
            'd51d809af628cc8292bd430a4847adb4adefa9d4b0aee00a55a84ff9630e167c')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility;System" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
    chmod 755 "${srcdir}/${_pkgname}/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/storage/iconfile.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}