# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=y2mp3-appimage
pkgver=2.5.9alpha
_pkgver=2.5.9-alpha
pkgrel=1
pkgdesc="An Electron app to download youtube playlist"
arch=('x86_64')
url="https://github.com/moshfeu/y2mp3"
license=('MIT')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${_pkgver}/${pkgname%-appimage}-${_pkgver}.AppImage"
  "LICENSE::https://raw.githubusercontent.com//moshfeu/y2mp3/master/LICENSE")
sha256sums=('9acdbb1535557d818eb4b4f86b4e27cf6c442cd1f66101530c33e200eaf66b2e'
            'e38ba30feb86e7387a43e735f2b65cf072436b3af6b3333abb4e6c460e6622fe')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|Music|AudioVideo|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
  done
}