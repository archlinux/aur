# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mmseqs2-search-appimage"
_appname="mmseqs-app"
pkgver=1.7.0
pkgrel=1
pkgdesc="MMseqs2 app to run on your workstation or servers"
arch=('x86_64')
url="https://search.mmseqs.com/"
_githuburl="https://github.com/soedinglab/MMseqs2-App"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v7-8e1704f/MMseqs2-Search-${pkgver}.AppImage")
sha256sums=('8741f3c9bb4ba43586c8e3abd8ff4438cb2a750fe0abb7c5d5afa23c80f98f03')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/mmseqs2-search.AppImage|g;s|mmseqs-app|mmseqs2-search|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}