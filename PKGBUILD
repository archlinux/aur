# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="leapp-appimage"
pkgver=0.17.5
pkgrel=2
pkgdesc="the DevTool to access your cloud"
arch=('x86_64')
url="https://www.leapp.cloud"
_githuburl="https://github.com/Noovolari/leapp"
license=('MPL2')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://asset.noovolari.com/latest/Leapp-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Noovolari/leapp/master/LICENSE")
sha256sums=('988373f5a9a8807829dbe2f481a04c895042911fb56fed0e3878dbd37100ef5a'
            'a830016911a348a54e89bd54f2f8b0d8fffdeac20aecfba8e36ebbf38a03f5ff')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/leapp.AppImage|g;s|/usr/share/icons/hicolor/256x256/apps/leapp.png|leapp|g' \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}