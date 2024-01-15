# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=somafm-desktop-player-bin
pkgver=0.0.24
_electronversion=16
pkgrel=4
pkgdesc="SomaFM desktop player built with Electron and React"
arch=("x86_64")
url="https://alechko.github.io/somafm-desktop-player/"
_ghurl="https://github.com/alechko/somafm-desktop-player"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/alechko/somafm-desktop-player/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('e5790fbe31508202725c3580466baad18cd90ac9c032f8c73ae63e10024fa8f7'
            '5e404eae8a20b20c3e2ab7e0a08d04012d2cf8d5bf266849a22d7aa810409381'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|Utility|AudioVideo|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/assets/icon.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}/assets"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/assets/icon.png"  "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}