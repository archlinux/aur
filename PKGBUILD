# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r3play-appimage
pkgver=2.0.0_alpha_2
pkgrel=5
pkgdesc="高颜值的第三方网易云播放器，支持 Windows/macOS/Linux.原名YesPlayMusic."
arch=('x86_64')
url="https://music.qier222.com/"
_githuburl="https://github.com/qier222/YesPlayMusic"
license=('MIT')
depends=('hicolor-icon-theme' 'glibc' 'zlib')
options=(!strip)
provides=("yesplaymusic")
conflicts=("${pkgname%-appimage}" "yesplaymusic")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/R3PLAY-${pkgver%_alpha_2}-linux.AppImage"
  "LICENSE::https://raw.githubusercontent.com/qier222/YesPlayMusic/master/LICENSE")
sha256sums=('6108bdc25f8c27fedd4cad07e8c6f20c3eed895bea46f6d73123ad889d927ec7'
            'c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 88x88 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/desktop.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|Music|AudioVideo|g;s|desktop|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/desktop.desktop"
    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}