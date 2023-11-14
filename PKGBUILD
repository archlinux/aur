# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=webkitty-bin
_pkgname=WebKitty
pkgver=3.2.1
pkgrel=3
pkgdesc="Local web development IDE"
arch=("x86_64")
url="https://dartfling.com/product?pid=3"
_ghurl="https://github.com/yikuansun/webkitty"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron24'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/yikuansun/webkitty/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('103f4ccb57d0e7685993b6cc1a47ead500f5eef0c63a7c501af36456e5d696f1'
            'c46ac74ef8cd13c7541f9de280f3d759319f70292fd32d4d170193041b06300b'
            'a01688f97371b639383f492c90cbbc33ef3d8e87dc86f0d44b1f306c31a42f41')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}e|g;s|Utility|Utility;Development|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}