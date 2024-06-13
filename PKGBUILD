# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orature-bin
_pkgname=Orature
pkgver=3.1.18_qa
_subver=9434
pkgrel=1
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
    'ffmpeg'
    'ffmpeg4.4'
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-${pkgver//_/-}+${_subver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('2b035391970782e51143c9fda141d5b555d2a91467083ff39bf55c0bb6d3cafe'
            'd0be9e7c2e65f9a60e7450088214d6f295fa152b53b0f90bcf9cefc428c90028')
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