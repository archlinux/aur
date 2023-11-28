# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=requestly-bin
_pkgname=Requestly
pkgver=1.5.13
pkgrel=1
pkgdesc="Debug your network request across all platforms and browsers using a single app"
arch=('x86_64')
url="https://requestly.io/"
_ghurl="https://github.com/requestly/requestly-desktop-app"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
    'electron22'
    'python'
    'nspr'
    'java-runtime'
    'nss'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "index.html::https://raw.githubusercontent.com/requestly/requestly-desktop-app/v${pkgver}/src/loadingScreen/index.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('0d23990550632183bc046de8ec052c1fb8762af48f969f4b8fd7773b0bc185f4'
            '458836a4541233742fec5da1bf75b151cc0b1f879b0574f362ae793d055a233d'
            '69462f4a08fc5443b8c7db17c081015ea7610a6e74015933ffb1e8639d8b1f88')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/assets" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/index.html" -t "${srcdir}/app.asar.unpacked/dist/loadingScreen"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    find "${srcdir}/squashfs-root" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,static} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}