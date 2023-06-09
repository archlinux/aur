# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="notesnook-appimage"
pkgver=2.5.2
pkgrel=1
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote."
arch=('aarch64' 'x86_64')
url="https://notesnook.com/"
_githuburl="https://github.com/streetwriters/notesnook"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
providers=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}_linux_arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}_linux_x86_64.AppImage")
sha256sums_aarch64=('1ee8ee0bd8536cead09aca00f01aaf614b13448af8c8c6adb919bba3fd4d83bb')
sha256sums_x86_64=('f07298b21bcc468bc882ec7fea29fb332d8dbf7e763ffa22ca1519c57bd55b48')
    
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
      -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
}