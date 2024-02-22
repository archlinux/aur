# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aniflix-bin
pkgver=0.0.1
_electronversion=23
pkgrel=8
pkgdesc="Anime Streaming Desktop App"
arch=('x86_64')
url="https://aniflix.lamaau.space/"
_ghurl="https://github.com/rizkhal/aniflix"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_0.1.0_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/rizkhal/aniflix/master/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('db3c22d7f9d359852125fd5f3dc570fe540d3e10b2a172472cbf0c9df2b986da'
            'c3cc74287725f86a3a56a0e4d88895716ff81ff3c576ae69221feaa2539c0f86'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "s|Categories=Video;|Categories=AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"    
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}