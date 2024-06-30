# Maintainer: yifwon <wyf9661 at gmail dot com>
pkgname=drawio-desktop-appimage
_pkgname=drawio
pkgver=24.6.4
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
sha512sums_x86_64=('bcd2d6ad6431053c72627965683f0c83c6a8aaffa249c86026b2779552ba920abe0fe5bb3cc1f405cc8e0583d0e562311e645f784ae6eeca4ce5014e958c78a7')
source_aarch64=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-arm64-${pkgver}.AppImage")
sha512sums_aarch64=('453a1906e0479654f2c6bfa36d36245fc14e7ac6ddcd2a45cc75096f79f355e5cdf72429e24eec1d3c2de5ea8beaf9f0e24037c6563c9fcf84ada1fbce89bc7c')
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
