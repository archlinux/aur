# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orature-bin
_pkgname=Orature
pkgver=3.1.33
_subver=10068
pkgrel=1
pkgdesc="An application for creating Narrations and Translations of Audio Bibles, Books, Resources, Commentaries, etc.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/Bible-Translation-Tools/Orature"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'libxtst'
    'libxrender'
    'ffmpeg4.4'
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}+${_subver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('cb13b4a4a7941a850d575d8ed7a0f7390920e4a03d9f97261f678c59ca8e6300'
            '2da799c244ab45eb58acdb280a0ee4e8b886977834af2c59f6b9ba2310ff7964')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    bsdtar -xf "${srcdir}/data."*
    find "${srcdir}/opt/${pkgname%-bin}/jre" -type f -exec chmod a-w {} +
    find "${srcdir}/opt/${pkgname%-bin}/jre" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/.install4j/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
