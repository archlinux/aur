# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nuclia-appimage"
pkgver=2.6.1
pkgrel=1
pkgdesc="A low-code API to build an AI & multi-language semantic search engine in minutes. For any data, including audios and videos, and any source."
arch=('x86_64')
url="https://nuclia.com/"
_githuburl="https://github.com/nuclia/frontend"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/NucliaDesktop-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/nuclia/frontend/main/LICENSE.md")
sha256sums=('6adad415188b8de2300e71082cc149ab7e8aa8b55695f6d898215ff621e76993'
            '7c18093059eeabbeac27a86cb0c7e187845d96331e9c5d8388ee8fc5d637da66')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}