# Original maintainer: zxp19821005 <zxp19821005 at 163 dot com>, adopted by mmvanheusden.
pkgname=steamdepotdownloadergui-appimage
_appname=SteamDepotDownloaderGUI
pkgver=2.4.1
pkgrel=1
pkgdesc="Easily download older versions of games from Steam using DepotDownloader"
arch=('aarch64' 'x86_64')
url="https://github.com/mmvanheusden/SteamDepotDownloaderGUI"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}=${pkgver}")
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'dotnet-sdk-6.0' 'unzip', 'fuse3')
options=('!strip')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}-x64.AppImage")
sha256sums_aarch64=('2431e58e3e870e71ec047673f673d3897872d0d245c5aff92635ba90e0412d97')
sha256sums_x86_64=('cd8a00d44b174b33d394997b56347d44b1a9f68b4d8c2444bd9401de4a2df0f0')
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