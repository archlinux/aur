# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="r3play-appimage"
pkgver=2.0.0alpha2
_subver=alpha-2
pkgrel=2
pkgdesc="高颜值的第三方网易云播放器，支持 Windows/macOS/Linux.原名YesPlayMusic."
arch=('x86_64')
url="https://music.qier222.com/"
_githuburl="https://github.com/qier222/YesPlayMusic"
license=('MIT')
depends=('hicolor-icon-theme' 'glibc' 'zlib')
options=(!strip)
provides=("qier222")
conflicts=("${pkgname%-appname}" "yesplaymusic" "yesplaymusic-appimage" "yesplaymusic-electron")
_install_path="/opt/appimages"
source=("${pkgname%-appname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver%alpha2}-${_subver}/R3PLAY-${pkgver%alpha2}-linux.AppImage"
  "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('6108bdc25f8c27fedd4cad07e8c6f20c3eed895bea46f6d73123ad889d927ec7'
            'c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6')
 
prepare() {
    chmod a+x "${pkgname%-appname}-${pkgver}.AppImage"
    "./${pkgname%-appname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/r3play.AppImage|g;s|Music|AudioVideo|g;s|desktop|r3play|g' -i "${srcdir}/squashfs-root/desktop.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appname}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 88x88 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/desktop.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}