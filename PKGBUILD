# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=primate-appimage
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern dashboard for Kong Gateway admins"
arch=('x86_64')
url="https://www.getprimate.xyz/"
_githuburl="https://github.com/getprimate/primate"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Primate-v${pkgver}-x64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/getprimate/primate/main/LICENSE")
sha256sums=('e49382a1289baa44a1bb596a040ea99397801f4f7ee6ae6febfab57646e321a7'
            'dd4c137b56da1d126c2aa91b11250f4b1c2973f4dec7f44ce904359bbb1d5612')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/primate.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}