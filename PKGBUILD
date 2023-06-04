# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stretchly-appimage
pkgver=1.14.1
pkgrel=1
pkgdesc="The break time reminder app"
arch=('x86_64')
url="https://hovancik.net/stretchly"
_githuburl="https://github.com/hovancik/stretchly"
license=('custom:BSD-2-Clause')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Stretchly-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/hovancik/stretchly/trunk/LICENSE")
sha256sums=('70222dc33910ac7d39ea87384dd3f739ab0e3b01cd7a9c34400866ced74c61ce'
            'd4262f71a6c02b19bdbdf760033803c0c7ca24acf2591ba425633f7e3315790a')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/stretchly.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}