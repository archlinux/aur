# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ppet3-appimage
_pkgname=ppet3
pkgver=3.3.0
pkgrel=1
pkgdesc="Put a cute girl on your desk for more fun.在你的桌面放一个萌妹子，多一点乐趣"
arch=('x86_64')
url="https://github.com/zenghongtu/PPet"
license=('MIT')
conflicts=(ppet3-bin)
depends=(hicolor-icon-theme zlib)
options=(!strip)
_install_path="/opt/appimages"
source=(
  "${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/PPet3-${pkgver}.AppImage"
)
sha512sums=('ef6da0f31b16f289cec24a6ba1f8e630660373cb3961bf057895e8ccb0898387092b8119f4f860b11f759c70f3d610086d5af54392a80248470a535aa16ae34f')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=${_install_path}/${_pkgname}.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}