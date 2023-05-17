# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="polar-appimage"
pkgver=2.0.0rc3
_appver=2.0.0-rc3
pkgrel=1
pkgdesc="One-click Bitcoin Lightning networks for local app development & testing"
arch=("x86_64")
url="https://lightningpolar.com/"
_githuburl="https://github.com/jamaljsr/polar"
license=('MIT')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${_appver}/${pkgname%-appimage}-linux-x86_64-V${_appver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/jamaljsr/polar/master/LICENSE")
sha256sums=('e80f26b5963d30a1c556db0f15b14ce8c8deef810a3b094c2865518a00dba27b'
            '971e947b52af09847d493b326953f2cbc91669441eab0d5e74eac38b8e162904')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/iamhex.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}