# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gpt-anywhere-appimage"
pkgver=0.0.1
pkgrel=1
pkgdesc="Use GPT anywhere with just one shortcut."
arch=('x86_64')
url="http://jinay.dev/gpt-anywhere/"
_githuburl="https://github.com/JinayJain/gpt-anywhere"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/app-v${pkgver}/${pkgname%-appimage}_${pkgver}_amd64.AppImage")
sha256sums=('5463b605eb886fa48cb6e504bbcc4ed31e661ac777810bd16cbdd5951279f0a8')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}