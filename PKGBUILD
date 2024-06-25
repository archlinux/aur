# Maintainer: yifwon <wyf9661 at gmail dot com>
pkgname=drawio-desktop-appimage
_pkgname=drawio
pkgver=24.6.1
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=('x86_64' 'aarch64')
url="https://www.diagrams.net/"
_githuburl="https://github.com/jgraph/drawio-desktop"
license=('Apache2')
options=(!strip)
conflicts=(drawio-desktop)
depends=('zlib' 'hicolor-icon-theme')
_install_path=/opt/${pkgname}
source_x86_64=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-x86_64-${pkgver}.AppImage")
sha512sums_x86_64=('50c7ffe9ce3f70dc9a385c1d768a55b7e952999894dc3bf440974d561498bd2fc9ddc8bcfbc1225ade1a2608670b9162bb41ca3e39365386693143fb43505688')
source_aarch64=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-arm64-${pkgver}.AppImage")
sha512sums_aarch64=('084c3a42a295f69ad82a93181712653f94ffea2a03798aa2451d4a969a2d39b2022f68acb241eced3b9142c41d209c0b5f4287f68aaae2bb2dfe978cf020b9e3')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=${_install_path}/${_pkgname}.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512 720x720 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
