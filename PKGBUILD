# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=helioslauncher-bin
_appname=Helios-Launcher
pkgver=2.0.6
pkgrel=1
pkgdesc="Custom launcher for modded minecraft written in Electron and Node.js"
arch=('x86_64')
url="https://github.com/dscalzi/HeliosLauncher"
license=('MIT')
depends=(
    'electron27'
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
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/dscalzi/HeliosLauncher/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('0b5baf9e01f7aa63ccdf174538f3561eabccfc04d59bba27cbd5d930e017a05e'
            '4ffd6e4c132ebc4ecde76d809f9f88e151ee0eb2175e7ea0f0b0b51a9d48539e'
            'aeb93699f3e3320b3579494b12322973c136dc4165eb27a875afd9fe9f853b3c')
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
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}