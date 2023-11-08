# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postybirb-bin
_pkgname=PostyBirb
pkgver=2.3.44
pkgrel=3
pkgdesc="An application that helps artists post art and other multimedia to multiple websites more quickly."
arch=('x86_64')
url="https://www.postybirb.com/"
_ghurl="https://github.com/mvdicarlo/postybirb"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-plus"
)
depends=(
    'bash'
    'electron13'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/mvdicarlo/postybirb/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('45dc119851f148344b3601f5a00de67e00d2575f9dd616bcbd82d4eeda97b49d'
            '12e65eb62d705f4cf38eb2f7b382206fb3155fbdbff559f87c702a5e1c1c2207'
            '0c8c3bc167aa11192f21e6d70394960300624e741d3c2f5851d284365c80f877')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}