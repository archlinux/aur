# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=marvin-bin
_appname=Marvin
pkgver=0.4.9
pkgrel=5
pkgdesc="An app launcher for Linux and Windows"
arch=('x86_64')
url="https://rolandbernard.github.io/marvin/"
_ghurl="https://github.com/rolandbernard/marvin"
license=('MIT')
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
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/rolandbernard/marvin/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('624a42d8d31d56bd9a3b82f4b6258ebffd9b5f5d623575b44b120f3646ae269e'
            '67cc90dae7113cf3572e7ae6b893b8e06960f696a6a1d3fc6b36b607cea970d6'
            '7b706a3604995834c338d5898757a8353b16d76285a20c4c7fe6256eb6305fa2')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}