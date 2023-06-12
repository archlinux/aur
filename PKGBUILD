# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=snapdrop-appimage
pkgver=1.0.4
pkgrel=4
pkgdesc="A Self Contained Desktop Version Of Snapdrop Made With Electron"
arch=('x86_64')
url="https://github.com/JustSch/node-snapdrop-electron"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages/"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-x64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/JustSch/node-snapdrop-electron/main/LICENSE")
sha256sums=('fa7e75d9ca2aa3f793d4e0429bee4654071ad5f027be53b2e9a748a691e0b0a9'
            '7f5b14a890fc05b278075f83944a89798f72df4756b29de289b17fef3f191703')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=snapdrop|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g;s|Icon=./${pkgname%-appimage}.png|Icon=${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}