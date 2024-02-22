# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shinden-client-bin
_pkgname=shinden-client
pkgver=3.0.5
_electronversion=23
pkgrel=3
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
sha256sums=('5bc7168349b3a8b385cef188ebfc070cb63267a5b2d319fce9df5a5abda37c4e'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|${pkgname%-bin}-electron|${pkgname%-bin}|g;s|${pkgname%-bin}-electron|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}-electron.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}-electron/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-electron.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}-electron.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}-electron/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}