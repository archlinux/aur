# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sabaki-appimage"
pkgver=0.52.2
pkgrel=1
pkgdesc="An elegant Go board and SGF editor for a more civilized age."
arch=('x86_64')
url="https://sabaki.yichuanshen.de/"
_githuburl="https://github.com/SabakiHQ/Sabaki"
license=('MIT')
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-electron")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-v${pkgver}-linux-x64.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/SabakiHQ/Sabaki/master/LICENSE.md")
sha256sums=('c2e0a3e47bcd65cd8a39d7393b8f6ea4d4e81432a230c59ec7291cb478b9d446'
            'a5c065dbac7a3076b8ac3437280ac8d721cb52c6c6ff8d0e5509fa9111c81349')
    
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/sabaki.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}