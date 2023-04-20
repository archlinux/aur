# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="apk-editor-studio-appimage"
pkgver=1.7.1
pkgrel=1
pkgdesc="Powerful yet easy to use APK editor for PC and Mac."
arch=('x86_64')
url="https://qwertycube.com/apk-editor-studio/"
_githuburl="https://github.com/kefir500/apk-editor-studio"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
providers=()
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}_linux_${pkgver}.AppImage")
sha256sums=('548cdee09e9951b577c0f2b9818ba90dbedef13ca4d57a7e20eab488c5ab1892')
    
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=apk-editor-studio|Exec=/opt/appimages/apk-editor-studio.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}