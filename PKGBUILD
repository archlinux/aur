# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="animos-appimage"
pkgver=0.5.8
pkgrel=1
pkgdesc="Clean and minimal Anime-streaming desktop application without any ads."
arch=("x86_64")
url="https://animos.cf/"
_githuburl="https://github.com/keerthivasansa/animos"
license=('custom')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-patterns")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Animos-${pkgver}.AppImage")
sha256sums=('91c6ff65c927a1e8d5955789eb716ee52882baabc5ee8f69d99c2c702eadff0e')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/animos.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}