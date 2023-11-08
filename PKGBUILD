# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monolith-code-bin
pkgver=2.2.6
pkgrel=1
pkgdesc="minimalistic but powerful code editor"
arch=("x86_64")
url="https://haeri.github.io/monolith-code"
_ghurl="https://github.com/Haeri/monolith-code"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron26'
    'gdk-pixbuf2'
    'libxext'
    'gtk2'
    'libdbusmenu-glib'
    'dbus-glib'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Haeri/monolith-code/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('62dc444c4a920e7f434b61363d5ffd2a0e66377efa9768d0e968dedd942a863d'
            '08712c74fe995972923ce4a30fa74bad068779afdf9d3b877c525e86c617adcc'
            '7c865497f32441982880297e2196bf3e580bcbb429bb81430e16936ecbdc468f')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/usr/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}