# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>
pkgname=motrix-appimage
pkgver=1.8.14
pkgrel=2
pkgdesc="A full-featured download manager,Support downloading HTTP, FTP, BitTorrent, Magnet, etc."
arch=('x86_64')
url="https://motrix.app/"
_githuburl="https://github.com/agalwood/Motrix"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Motrix-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/master/LICENSE")
sha256sums=('8784d9cc4c65d734e1c3394a06d2f4bb75758c58e334cd82b1ccb88468abf53b'
            'f60775e705e2c7418665ac2c7f386d28cc2927df98a440ced1703a7ed3ca86b7')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/vgmtrans.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-appimage}.xml" -t "${pkgdir}/usr/share/mime"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}