# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="spacemesh-appimage"
pkgver=0.3.6
pkgrel=1
pkgdesc="Spacemesh App (Smesher + Wallet)"
arch=('x86_64')
url="https://spacemesh.io/"
_githuburl="https://github.com/spacemeshos/smapp"
license=('Apache')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://storage.googleapis.com/smapp/v${pkgver}/Spacemesh-${pkgver}.AppImage")
sha256sums=('78a3f3c88ed7e5f2a63a9e8562519b827bc9bf7e49138f455364192ea5fccdb6')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/spacemesh.AppImage|g;s|spacemesh_app|spacemesh|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}_app.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}_app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}_app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}