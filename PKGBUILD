# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nuclia-appimage
_appname=NucliaDesktop
pkgver=2.6.19
pkgrel=1
pkgdesc="A low-code API to build an AI & multi-language semantic search engine in minutes. For any data, including audios and videos, and any source."
arch=('x86_64')
url="https://nuclia.com/"
_githuburl="https://github.com/nuclia/frontend"
license=('MIT')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/nuclia/frontend/${pkgver}/LICENSE.md")
sha256sums=('ea50032192dc6325a54f91b6b881bc00d5e425a374f5e0472a87836f64ce658a'
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
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}