# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="leapp-appimage"
pkgver=0.18.0
pkgrel=1
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
sha256sums=('f54261054f39036b97e5ad859502e0760a08579b6e4b9aa25aa99d00c104572f'
            'a830016911a348a54e89bd54f2f8b0d8fffdeac20aecfba8e36ebbf38a03f5ff')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png|${pkgname%-appimage}|g" \
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