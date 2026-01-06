# Maintainer: yifwon <wyf9661 at gmail dot com>
# Contributor: witt <1989161762 at qq dot com>
pkgname=drawio-desktop-appimage
_pkgname=drawio
pkgver=29.2.9
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=('x86_64' 'aarch64')
url="https://www.diagrams.net/"
_githuburl="https://github.com/jgraph/drawio-desktop"
license=('Apache2')
options=(!strip)
provides=(drawio-desktop)
conflicts=(drawio-desktop)
depends=('zlib' 'hicolor-icon-theme' 'glibc' 'fuse2')
_install_path=/opt/${pkgname}
source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-x86_64-${pkgver}.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-arm64-${pkgver}.AppImage")
sha1sums_x86_64=('e1eed30d15a4a32bf15e5bf9997abcf82aec396e')
sha1sums_aarch64=('33865cf7be010b3bb8d2afb48855c85ee9308437')

prepare() {
    chmod +x "${_pkgname}-${pkgver}-${CARCH}.AppImage"
    "./${_pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/Exec=.*/Exec=${_pkgname}/g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${_install_path}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
