# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="moyu-appimage"
pkgver=0.8.0beta
_appver=0.8.0-beta
pkgrel=1
pkgdesc="基于 Vue 和 Electron 的在线协同api接口管理工具。接口文档管理工具、接口工具、接口文档、api文档、api工具、快乐摸鱼"
arch=('x86_64')
url="https://online.jobtool.cn/"
_githuburl="https://github.com/trueleaf/moyu"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${_appver}/moyu-${_appver%-beta}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/trueleaf/moyu/master/LICENSE")
sha256sums=('0dab0db5b1492b06f52104dcc4ebe7acce3817fb8b6abb3d9523bff69a2dcb19'
            'bbef3f01685fbef2be49493df601daf55815b3a044fb7361e160c9074ea515f7')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/moyu.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}