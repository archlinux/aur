# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xilinota-bin
_pkgname=Xilinota
pkgver=2.13.5_2
pkgrel=1
pkgdesc="A free and open source (FOSS) note-taking and to-do project delivering applications,capable of handling large number of notes organised in notebooks, and syncing notes across the platforms in various ways."
arch=("x86_64")
url="https://github.com/XilinJia/Xilinota"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron25'
    'hicolor-icon-theme'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
    'lib32-gcc-libs'
    'lib32-glibc'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver//_/-}/${_pkgname}-2.13.4.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('9802b192161d6e4de9365cc964006d1fe36954224e445e7a7b60d2e8ac9a3418'
            'dd54ae23385bbc4ad04e1504775079ecc342df1852b6b457e4910ac49307feee')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/@${pkgname%-bin}app-desktop.desktop"
    find "${srcdir}/squashfs-root" -type d -exec chmod 755 {} \;
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,build} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/@${pkgname%-bin}app-desktop.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 72x72 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/@${pkgname%-bin}app-desktop.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}