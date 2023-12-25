# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nuclia-appimage
_appname=NucliaDesktop
pkgver=2.7.7
_electronversion=24
pkgrel=1
pkgdesc="A low-code API to build an AI & multi-language semantic search engine in minutes. For any data, including audios and videos, and any source."
arch=('x86_64')
url="https://nuclia.com/"
_ghurl="https://github.com/nuclia/frontend"
license=('MIT')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'hicolor-icon-theme'
)
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/nuclia/frontend/${pkgver}/LICENSE.md"
)
sha256sums=('213ae4d1dcfc52c4b5a38cc1de31a5901efb63d1def1480af4d437eac33b0fe5'
            '7c18093059eeabbeac27a86cb0c7e187845d96331e9c5d8388ee8fc5d637da66')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}