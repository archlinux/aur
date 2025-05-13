# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=adagate-bin
_pkgname=AdaGate
_shortname=agate
pkgver=7.4.7
pkgrel=3
pkgdesc="A kid-friendly 3D dungeon escape game within a Stargate fantasy setting.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/fastrgv/AdaGate"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libx11'
    'openal'
    'libglvnd'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/v${pkgver}/ag8jul24.7z"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/fastrgv/AdaGate/v${pkgver}/${pkgname%-bin}.jpg"
    "${pkgname%-bin}.sh"
)
sha256sums=('aaa8c99e8f0e83e22b557a852d8f33a12c8f0d42779460602bdc5e68c1706ea3'
            'd7c362ed4529df6bfdde61b37fb17683719d13d566a7ce4d699ce0f6302b07a2'
            'f3a62692c81c18084bdaa42f52720002ff9cd2243ba38ed6f7d0981ebab01269')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Game" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
    find "${srcdir}/${_shortname}/data" -type d -exec chmod 755 {} +
    rm -rf "${srcdir}/${_shortname}/data/resume_ag.txt"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_shortname}/${pkgname%-bin}_gnu" "${pkgdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_shortname}/data" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_shortname}/libs/gnu/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/libs/gnu"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}