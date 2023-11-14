# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kanbanflow-app-bin
_appname=KanbanFlow-App
pkgver=1.0.0_beta.4
pkgrel=3
pkgdesc="A standalone application for Kanbanflow.com"
arch=('x86_64')
url="https://github.com/metawave/kanbanflow-app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron13'
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
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${_appname}-${pkgver//_/-}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/metawave/kanbanflow-app/v${pkgver//_/-}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('a8146d290fdf4d9e4e62b4fa57fab35bf6db21aa43876bc685a0bdca4bd4ebba'
            '4dcd2e7fe6343b8c84f2996f9713c67ee8e917c8e3606ce9ec221279ac5bfc26'
            '48e0c437a8d7060f408376331185a50d7e0c4cd1af42f569393ce7d8f65a2073')
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
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}