# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=steamdepotdownloadergui-appimage
_appname=SteamDepotDownloaderGUI
pkgver=2.2.0
pkgrel=2
pkgdesc="Easily download older versions of games from Steam using DepotDownloader"
arch=('aarch64' 'x86_64')
url="https://github.com/mmvanheusden/SteamDepotDownloaderGUI"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}=${pkgver}")
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'dotnet-sdk-6.0')
options=('!strip')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-x64.AppImage")
sha256sums_aarch64=('d7ffc05a6dec25d5d515dd1bdb2362639b4374388b6fe30ac8a4d3e9dbafa69a')
sha256sums_x86_64=('53e4667a4f6373d4dd7cb86836ca030daf959f2d219422212d1bbfad38d89f57')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications"
}