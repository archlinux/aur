# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="electron-tools-appimage"
pkgver=1.0.0
pkgrel=1
pkgdesc="Toolbox based on Electron 25, Vite 4, Vue 3, element plus 2, TypeScript 5.基于 Electron 25、Vite 4、Vue 3、element-plus 2、TypeScript 5 的工具箱"
arch=('x86_64')
url="https://github.com/xuxiaowei-com-cn/electron-tools"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}-2023-06-03T19-05Z/${pkgname%-appimage}_${pkgver}-node-18.x-${CARCH}.AppImage"
  "LICENSE::https://raw.githubusercontent.com/xuxiaowei-com-cn/electron-tools/main/LICENSE")
sha256sums=('e5b3e2f57292bf47f171babfa77036c25d31cd61bbfe6d6905317a80fb3ea521'
            'fb94fa24a71011f12af9b7ac20de0b67555efede948bd606d8315428b35a90e6')
     
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}