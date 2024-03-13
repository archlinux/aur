# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orature-bin
_pkgname=Orature
pkgver=1.9.3
_subver=8693
pkgrel=2
pkgdesc="An application for creating Narrations and Translations of Audio Bibles, Books, Resources, Commentaries, etc."
arch=("x86_64")
url="https://github.com/Bible-Translation-Tools/Orature"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'libxtst'
    'libxrender'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-${pkgver//_/-}+${_subver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('c7b80629fc7fff701cf728923fec66f7bbb6def70d3720aeb59757aa1efcd8e6'
            '8e0043b31ea7234b44d4aeb8fa22ac8528073a4f95180700704aef924b81389c')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Development" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    bsdtar -xf "${srcdir}/data."*
    find "${srcdir}/opt/${pkgname%-bin}/jre" -type f -exec chmod a-w {} \;
    find "${srcdir}/opt/${pkgname%-bin}/jre" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/.install4j/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}