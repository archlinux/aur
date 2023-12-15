# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orature-bin
_pkgname=Orature
pkgver=3.1.1_qa
_subver=7769
pkgrel=1
pkgdesc="An application for creating Narrations and Translations of Audio Bibles, Books, Resources, Commentaries, etc."
arch=("x86_64")
url="https://github.com/Bible-Translation-Tools/Orature"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libx11'
    'alsa-lib'
    'libxrender'
    'libxext'
    'libxtst'
    'libxi'
    'java-runtime'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-${pkgver//_/-}+${_subver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('8f7d5b7d0e36f36c4503ca5aebfa5dcddca5e1f1a8cbede8e2aa66f6e7feabe2'
            '6a84e48641e9fcd3c09fa1b934f266ce94bb24763f8342be61a8221ceeb6aab1')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@apprunname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin}"
    bsdtar -xf "${srcdir}/data.tar.gz"
    find "${srcdir}/opt/${pkgname%-bin}/jre" -type f -exec chmod a-w {} \;
    find "${srcdir}/opt/${pkgname%-bin}/jre" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/.install4j/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}