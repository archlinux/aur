# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moneydance-bin
_pkgname=Moneydance
pkgver=2024.1
pkgrel=1
pkgdesc="An easy to use and full-featured personal finance app that doesn't compromise your privacy. "
arch=('x86_64')
url="https://infinitekind.com/moneydance"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://infinitekind.com/stabledl/current/${pkgname%-bin}_linux_amd64.deb"
)
sha256sums=('330b72c2cca5ad4736efa125473776db2e4a870a33899ebb38ed7736c3cf6ba9')
build() {
    bsdtar -xf "${srcdir}/data."*
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Finance;Utility" --name="${_pkgname}" --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{lib/"${pkgname%-bin}",bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 32x32 128x128 512x512;do
        install -Dm644 "${srcdir}/opt/${_pkgname}/resources/${pkgname%-bin}_icon${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}