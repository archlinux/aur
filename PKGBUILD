# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=copybook-bin
pkgver=1.0.1102
pkgrel=2
pkgdesc="生成拼音、汉字、汉字字帖"
arch=('x86_64')
url="https://github.com/xxNull-lsk/Copybook"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('add5907d8e6bb710327b5a719ba7cf9d004efb021c68475a47644dc50524fe77'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\/data\/flutter_assets\/res\/app.png/${pkgname%-bin}/g
        s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}/${pkgname%-bin} %U/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/data/flutter_assets/res/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}