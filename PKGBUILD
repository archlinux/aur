# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mmseqs2-search-appimage
_appname=mmseqs-app
_pkgname=MMseqs2-Search
pkgver=1.7.0
_electronversion=12
pkgrel=6
pkgdesc="MMseqs2 app to run on your workstation or servers"
arch=(
    'aarch64'
    'x86_64'
)
url="https://search.mmseqs.com/"
_ghurl="https://github.com/soedinglab/MMseqs2-App"
license=('GPL-3.0-or-later')
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
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v7-8e1704f/${_pkgname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v7-8e1704f/${_pkgname}-${pkgver}.AppImage")
sha256sums_aarch64=('afe09835f2763f8c3fdb08d0f33de8d0ac262c7ea41038203d093f7c0682eb0e')
sha256sums_x86_64=('8741f3c9bb4ba43586c8e3abd8ff4438cb2a750fe0abb7c5d5afa23c80f98f03')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}