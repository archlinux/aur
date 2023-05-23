# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="duskplayer-appimage"
pkgver=7.0.0
pkgrel=1
pkgdesc="A minimal music player built on electron."
arch=('x86_64')
url="https://github.com/Aveek-Saha/DuskPlayer"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/DuskPlayer-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Aveek-Saha/DuskPlayer/master/LICENSE")
sha256sums=('7499e9b41e240b71c801b47c2145ef471308b07463251e3f912a9b6e98ea5e1e'
            '634de9f3cc2e60e2040fb2162e8722d13ee3d863d9b5a1c65c3e08a6149bee1c')
    
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/duskplayer.AppImage|g;s|Utility|AudioVideo|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
      -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
