# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shinden-client-bin
_pkgname=shinden-client
pkgver=3.1.0
_electronversion=29
pkgrel=1
pkgdesc="Unofficial client for the polish anime websites. It allows you to watch anime without being exposed to ads and pop-ups."
arch=("x86_64")
url="https://github.com/KlapChat-Entertainment/shinden-client"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-electron_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('369a7117cd1687f3bc3871d050e82f992ebec2a8cb36c5cc15d87861c2518e73'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|${pkgname%-bin}-electron|${pkgname%-bin}|g;s|${pkgname%-bin}-electron|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}-electron.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}-electron/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-electron.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}-electron.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}-electron/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}