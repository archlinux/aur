# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="des-talk-appimage"
pkgver=0.1.2
pkgrel=1
pkgdesc="A ChatGPT clone for desktop made with Tauri and React.js"
arch=('x86_64')
url="https://github.com/Red-Spaces/DesTalk"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}_${pkgver}_amd64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Red-Spaces/DesTalk/stable/LICENSE")
sha256sums=('906f5658f55b00a0109dacfe22dffaf264faace606c1a8ff076851c181c08ebd'
            '9f0d47ac26c0c5a6780c541ad8a392ec796c9933abf93260595ed641d8e623f2')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=des-talk|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
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
