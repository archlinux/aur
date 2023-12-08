# Original maintainer: zxp19821005 <zxp19821005 at 163 dot com>, adopted by mmvanheusden.
pkgname=steamdepotdownloadergui-appimage
_appname=SteamDepotDownloaderGUI
pkgver=2.3.1
pkgrel=1
pkgdesc="Easily download older versions of games from Steam using DepotDownloader"
arch=('aarch64' 'x86_64')
url="https://github.com/mmvanheusden/SteamDepotDownloaderGUI"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}=${pkgver}")
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'dotnet-sdk-6.0' 'unzip')
options=('!strip')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}-x64.AppImage")
sha256sums_aarch64=('8489b739ee47353af7a2ec81bfac681f411048f5022eb6cf2de9a641e602c44c')
sha256sums_x86_64=('b82b4cf06a729ab31ecff354457f3bb355403869e1daa7650b8c3eb293086001')
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