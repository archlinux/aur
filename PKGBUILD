# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="envkey-appimage"
pkgver=1.5.10
pkgrel=1
pkgdesc="Secure, human-friendly, cross-platform secrets and config."
arch=('x86_64')
url="https://www.envkey.com/"
_githuburl="https://github.com/envkey/envkey-app"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('lib32-zlib' 'lib32-glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/linux-ia32-prod-v${pkgver}/EnvKey-${pkgver}-i386.AppImage"
    "LICENSE::https://raw.githubusercontent.com/envkey/envkey-app/master/LICENSE")
sha256sums=('906006984188184a967a81474dd03d29e0bff2559a32396c66a2d4f3ee476745'
            '09b057e89473140a66ebb115d2c45af606ae7a7a3f1a8debad96f49bbea74ddd')
     
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/envkey.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
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
