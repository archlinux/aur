# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chat-gpt-appimage
pkgver=1.0.0
pkgrel=1
pkgdesc="ChatGPT Desktop Application (Mac, Windows and Linux)"
arch=('x86_64')
url="https://nofwl.com/"
_githuburl="https://github.com/lencx/ChatGPT"
license=('AGPL3')
options=(!strip)
conflits=("${pkgname%-appimage}" "chatgpt-desktop-bin")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/ChatGPT_${pkgver}_linux_x86_64.AppImage.tar.gz")
sha256sums=('aac475e3d44e7104d66a9c26ff1333df14f8188d9e4d6a29b6052622930021d8')
prepare() {
    chmod a+x "${pkgname%-appimage}_${pkgver}_amd64.AppImage"
    "./${pkgname%-appimage}_${pkgver}_amd64.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=chat-gpt|Exec=/opt/appimages/chat-gpt.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}_${pkgver}_amd64.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 32x32 128x128 256x256@2; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}