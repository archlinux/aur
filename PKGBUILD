# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=copybook-bin
pkgver=1.0.1096
pkgrel=3
pkgdesc='生成拼音、汉字、汉字字帖'
arch=(x86_64)
url="https://github.com/xxNull-lsk/Copybook"
license=('BSD')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'cairo'
    'pango'
    'at-spi2-core'
    'gtk3'
    'libepoxy'
    'gdk-pixbuf2'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('5378a01b40833eac3d0383bd55eec8c6c742f53a2b812cc5d94a34be7a3ef2da'
            '07c295fbb74a50ae5c27e5d0ee1a55f8ef4f3be793dcb7490d8d7df20be9d90a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/data/flutter_assets/res/app.png|${pkgname%-bin}|g;s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/data/flutter_assets/res/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}