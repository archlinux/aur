# Contributor: Robin H. <robin at blckct dot io>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=sonixd
pkgname="${_pkgname}-appimage"
pkgver=0.15.5
pkgrel=2
pkgdesc="A full-featured Subsonic/Jellyfin compatible desktop music player"
arch=('x86_64')
url="https://github.com/jeffvli/sonixd"
license=(GPL3)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
provides=(jeffvli)
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Sonixd-${pkgver}-linux-x86_64.AppImage")
sha256sums=('8fc07ea3f089e52b193cc35bba0c8fdd3f4a6fec6ec655711f4da5a31970c038')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/sonixd.AppImage/g;s/Development/AudioVideo/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}
