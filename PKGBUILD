# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=brisk-bin
_pkgname=Brisk
pkgver=1.4.3
pkgrel=2
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
    "${pkgname%-bin}.sh"
)
sha256sums=('5450016aec5dc5eefb27056711cdff3aaa9b66dd5292da6afb18e3ef4ec91022'
            '840eb0ad528d294064aa09b2b6df7a0e4a800249f43305c756cf78bee627fe1d')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    mv "${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH}/"* "${srcdir}/opt/${pkgname%-bin}"
    gendesk -f -n -q --categories="Network" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/data/flutter_assets/assets/icons/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}