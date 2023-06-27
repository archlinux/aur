# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=station-appimage
pkgver=2.2.0
pkgrel=1
pkgdesc="One app to rule them all!"
arch=('x86_64')
url="https://getstation.com/"
_githuburl="https://github.com/getstation/desktop-app"
license=('Apache')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Station-x86_64.AppImage")
sha256sums=('7027bec4dc8a596fb3e305c2d3b6dfd47cfc24c52215106ab6102754f684bc29')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${pkgname%-appimage}-desktop-app|${pkgname%-appimage}|g" \
      -i "${srcdir}/squashfs-root/${pkgname%-appimage}-desktop-app.desktop"
} 
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}-desktop-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
  for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}-desktop-app.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
  done
}