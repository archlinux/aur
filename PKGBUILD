# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mmseqs2-search-appimage
_appname=mmseqs-app
_pkgname=MMseqs2-Search
pkgver=1.7.0
pkgrel=3
pkgdesc="MMseqs2 app to run on your workstation or servers"
arch=('aarch64' 'x86_64')
url="https://search.mmseqs.com/"
_githuburl="https://github.com/soedinglab/MMseqs2-App"
license=('GPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v7-8e1704f/${_pkgname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v7-8e1704f/${_pkgname}-${pkgver}.AppImage")
sha256sums_aarch64=('afe09835f2763f8c3fdb08d0f33de8d0ac262c7ea41038203d093f7c0682eb0e')
sha256sums_x86_64=('8741f3c9bb4ba43586c8e3abd8ff4438cb2a750fe0abb7c5d5afa23c80f98f03')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}