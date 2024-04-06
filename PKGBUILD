# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=adagate-bin
_pkgname=AdaGate
_shortname=agate
pkgver=7.4.6
pkgrel=1
pkgdesc="A kid-friendly 3D dungeon escape game within a Stargate fantasy setting"
arch=("x86_64")
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
    "${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/v${pkgver}/ag4apr24.7z"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/fastrgv/AdaGate/v${pkgver}/${pkgname%-bin}.jpg"
    "${pkgname%-bin}.sh"
)
sha256sums=('31fb7fb62a61f46792e7ac28ca28b5053df365ad6bd327f64400b53d8981a780'
            'd7c362ed4529df6bfdde61b37fb17683719d13d566a7ce4d699ce0f6302b07a2'
            '44417192dcaa79a66744f35d93945490ab3e4c7042915aac43b08c8b66bf5bc1')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Game" --name="${_pkgname}" --exec="${pkgname%-bin}"
    find "${srcdir}/${_shortname}/data" -type d -exec chmod 755 {} \;
    rm -rf "${srcdir}/${_shortname}/data/resume_ag.txt"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_shortname}/${pkgname%-bin}_gnu" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/${_shortname}/data" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_shortname}/libs/gnu/"* -t "${pkgdir}/opt/${pkgname%-bin}/libs/gnu"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}