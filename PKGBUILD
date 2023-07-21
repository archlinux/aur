# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="steamdepotdownloadergui-appimage"
_appname=SteamDepotDownloaderGUI
pkgver=2.1.1
pkgrel=3
pkgdesc="Easily download older versions of games from Steam using DepotDownloader"
arch=('aarch64' 'x86_64')
url="https://github.com/mmvanheusden/SteamDepotDownloaderGUI"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'dotnet-sdk-6.0')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-x64.AppImage")
sha256sums_aarch64=('c650c3c39832e50259bfadabcfac5242c0ba5992f583c8ca1a7a96b5255515f8')
sha256sums_x86_64=('d12724f5bfdeb03e8c83ecc9a7ac197f99a324144a3a39446f14299bd8d09e4d')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications"
}