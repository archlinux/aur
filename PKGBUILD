# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=steamdepotdownloadergui-bin
_pkgname=SteamDepotDownloaderGUI
pkgver=2.3.0
pkgrel=1
pkgdesc="Easily download older versions of games from Steam using DepotDownloader"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/mmvanheusden/SteamDepotDownloaderGUI"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'bash'
    'electron25'
    'hicolor-icon-theme'
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
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-x64.AppImage")
sha256sums=('856876cf4c6828e4722fd1f1a8390c67595fd28deec93edd1b039270c7287063')
sha256sums_aarch64=('b56d2336305f5650c78e7ac6d836bdd9d8240400b333a1f855481dde02b28ca4')
sha256sums_x86_64=('90133f36d902ffb90df6997d4a839000588625cc394a15cb0f34428b3e207646')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}