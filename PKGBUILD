# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="museeks-appimage"
pkgver=0.13.1
pkgrel=3
pkgdesc="A simple, clean and cross-platform music player"
arch=("x86_64")
url="https://museeks.io/"
_githuburl="https://github.com/martpie/museeks"
license=('MIT')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
provides=(martpie)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-appimage}-x86_64.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('2efba7842166a6fd344e75f35a3a779105008682a99a9ea9a8a81c694a9957ea'
            '6f09c1eea17a3c9d1b6ad335090a9b102552079a15e4de1fc5d106c401106ba4')
        
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/nullExec=\
    sed 's|AppRun|/opt/appimages/museeks.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
        
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}