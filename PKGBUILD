# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frigoligo-bin
_pkgname=Frigoligo
pkgver=0.8.0
pkgrel=1
pkgdesc="An universal wallabag client made with Flutter. "
arch=('x86_64')
url="https://github.com/casimir/frigoligo"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/casimir/frigoligo/v${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/casimir/frigoligo/v${pkgver}/assets/logos/frigoligo.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('a34b6da6b61625a2fbf08034de673e808b438e601ca9ba75b0aaffce8d1e2ab2'
            '3feb1ea09cc75f148e715820992fd28a3881572e3540b629059f22293b2e17db'
            '886063acc61302d4ee369f06b6062257883dd4e3f1d6ab199ca8e64db3091491'
            '8127f217ae3e217c4aa005d1ec22ad5f16c17e11471881d9e4277d6bb479445e')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    install -Dm755 -d "${srcdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" -C "${srcdir}/opt"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}