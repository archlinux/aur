# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="frappe-books-appimage"
pkgver=0.14.1
pkgrel=1
pkgdesc="Modern desktop accounting for freelancers and small-businesses."
arch=('x86_64')
url="https://frappebooks.com/"
_githuburl="https://github.com/frappe/books"
license=('AGPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Frappe-Books-${pkgver}.AppImage")
sha256sums=('ce4f9b142cb99a1c8532e4bdbf968ec6d1e355bec98d05a8bc954b0850defb97')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/frappe-books.AppImage|g;s|Finance|Utility|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}