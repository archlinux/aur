# Maintainer: yifwon <wyf9661 at gmail dot com>
# Contributor: witt <1989161762 at qq dot com>
pkgname=drawio-desktop-appimage
_pkgname=drawio
pkgver=28.2.5
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
sha1sums_x86_64=('667dfc7befcaf7c058f0761be42bd9017c280f2a')
sha1sums_aarch64=('cdd11098eb8fb828d09f095e456cb40b3b0a1a89')

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
