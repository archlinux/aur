# Maintainer: qvshuo <qvshuo at foxmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="yesplaymusic-appimage"
pkgver=0.4.7
pkgrel=3
pkgdesc="高颜值的第三方网易云播放器，支持 Windows / macOS / Linux。"
arch=('x86_64')
url="https://music.qier222.com/"
_githuburl="https://github.com/qier222/YesPlayMusic"
license=('MIT')
depends=('hicolor-icon-theme' 'glibc' 'zlib')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/YesPlayMusic-${pkgver}.AppImage"
  "LICENSE::https://raw.githubusercontent.com/qier222/YesPlayMusic/master/LICENSE")
sha256sums=('cb4876bbf938502acac84ff68febc863e2bcdf9a5e4a4b964e17309b7ee3704e'
            'c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6')
 
prepare() {
  chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
  "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
  sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|Music|AudioVideo|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  for _icons in 16x16 24x24 32x32 48x48 64x64 88x88 128x128 256x256 512x512 1024x1024;do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
      -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
  done
  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}