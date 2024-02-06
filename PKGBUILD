# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=brisk-bin
_pkgname=Brisk
pkgver=1.4.3
pkgrel=1
pkgdesc="Fast, multithreaded, cross-platform download manager"
arch=('x86_64')
url="https://github.com/AminBhst/brisk"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libkeybinder3'
    'libappindicator-gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${CARCH}.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/AminBhst/brisk/v${pkgver}/assets/icons/logo.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('5450016aec5dc5eefb27056711cdff3aaa9b66dd5292da6afb18e3ef4ec91022'
            '9a706b7a56a7f35903d9fe6440e347c4687c38965ae0ee7f1441acee615e3907'
            '1e338ff128b2be2b0d484ea2d00814db6709a5e2cc455a373428d21f8ed690d5')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    mv "${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH}/"* "${srcdir}/opt/${pkgname%-bin}"
    gendesk -f -n -q --categories "Network" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}