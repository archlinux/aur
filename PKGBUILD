# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="tauri-ui-appimage"
pkgver=0.1.3
pkgrel=1
pkgdesc="Create modern desktop applications with Tauri and shadcn/ui."
arch=('x86_64')
url="https://github.com/agmmnn/tauri-ui"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}_${pkgver}_amd64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/agmmnn/tauri-ui/master/LICENSE")
sha256sums=('b734d3acf7267da1290c969cf871531776e889059a8c4e93d544e240ef515f34'
            '28ade86a3ae7c86de8f439505b9900c83d4ce190bd8258522aa94bca93d546f4')
      
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}