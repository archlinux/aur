# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=helioslauncher-bin
_appname=Helios-Launcher
pkgver=2.0.4
pkgrel=5
pkgdesc="Custom launcher for modded minecraft written in Electron and Node.js"
arch=('x86_64')
url="https://github.com/dscalzi/HeliosLauncher"
license=('MIT')
depends=(
    'electron24'
    'java-runtime'
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
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-setup-${pkgver}.AppImage"
    "LICENSE.txt::https://raw.githubusercontent.com/dscalzi/HeliosLauncher/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('6fd6a2d100e4ff8cd89fb491ca973ed2d751cb51217050ad432223ccb0dc000c'
            '4ffd6e4c132ebc4ecde76d809f9f88e151ee0eb2175e7ea0f0b0b51a9d48539e'
            '31b08545e2c1e82ca3db742b5d0a039b904530391704f02147cf30ec4d7709dc')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/libraries/java/PackXZExtract.jar" -t "${pkgdir}/usr/lib/${pkgname%-bin}/libraries/java"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}