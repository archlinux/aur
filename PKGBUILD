# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vgmtrans-appimage
pkgver=1.1preview
pkgrel=1
pkgdesc="A tool to convert proprietary, sequenced videogame music to industry-standard formats"
arch=('x86_64')
url="https://github.com/vgmtrans/vgmtrans"
license=('custom')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver%preview}/${pkgname%-appimage}-preview-v${pkgver%preview}.AppImage"
    "LICENSE.txt::${url}/master/LICENSE.txt")
sha256sums=('a9d94aedde9992602fb1b93093783d236a8310a71227b2dd0597914deb4a89bc'
            '9ed0ea570d7c9057a76331909693d3e7ef3439e5722ba111f4d51489a3272ede')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=vgmtrans|Exec=/opt/appimages/vgmtrans.AppImage --no-sandbox %U|g' -i "${srcdir}/squashfs-root/VGMTrans.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/VGMTrans.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}