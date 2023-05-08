# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lbry-desktop-appimage
pkgver=0.53.9
pkgrel=1
pkgdesc="A browser and wallet for LBRY, the decentralized, user-controlled content marketplace."
arch=('x86_64')
url="https://lbry.tech/"
_githuburl="https://github.com/lbryio/lbry-desktop"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/LBRY_${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/lbryio/lbry-desktop/master/LICENSE")
sha256sums=('164a886b31387881286d8441b2d5df3d687a31309a35c08b935e320c60b8ad19'
            'da7dc7c9aea36eca669b29228af0e4fbf3f788167013f736b607b3681cc2b433')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/lbry-desktop.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-desktop-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 32x32 48x48 96x96 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-desktop-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-desktop-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}