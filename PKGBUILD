# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="blockbench-appimage"
pkgver=4.7.4
pkgrel=1
pkgdesc="A low poly 3D model editor"
arch=('any')
url="https://www.blockbench.net/"
_githuburl="https://github.com/JannisX11/blockbench"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Blockbench_${pkgver}.AppImage")
sha256sums=('626469f43f8d2dc4592bbf5b39aa114c8cae980ea3f359163f46ae4834a505cb')
    
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/blockbench.AppImage|g;s|3DGraphics|Graphics|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}