# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=runelite-launcher-appimage
pkgver=2.7.2
pkgrel=1
pkgdesc='Open source Old School RuneScape client. (AppImage Launcher)'
arch=('x86_64' 'aarch64')
license=('BSD')
url='https://github.com/runelite/launcher'
_appimage="RuneLite.AppImage"
_appimage_aarch64="RuneLite-aarch64.AppImage"
source=(runelite-launcher.desktop)
source_x86_64+=("${url}/releases/download/${pkgver}/${_appimage}")
source_aarch64+=("${url}/releases/download/${pkgver}/${_appimage_aarch64}")
sha256sums=('SKIP')
sha256sums_x86_64=('9401829e0adb130d5886cc3f9b95b5c63fa0b4db4943181e9ed52561438581e7')
sha256sums_aarch64=('6ee76f9eb459d0bdf105f141d77387e5768f2be9730613ac9c612fa3c0966ffb')
options=(!strip)
optdepends=('gvfs: enable links')
conflicts=('runelite-launcher')

prepare() {
    if [[ "$CARCH" == "x86_64" ]]; then
        true
    elif [[ "$CARCH" == "aarch64" ]]; then
        mv "${_appimage_aarch64}" "${_appimage}"
    else
        exit 1
    fi

    # Remove old extracted appimage to prevent extract error
    rm -rf squashfs-root
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract > /dev/null
}

package() {
    install -Dm644 \
        "${srcdir}/runelite-launcher.desktop" \
        "${pkgdir}/usr/share/applications/runelite-launcher.desktop"

    install -Dm644 \
        "${srcdir}/squashfs-root/runelite.png" \
        "${pkgdir}/usr/share/pixmaps/runelite-launcher.png"

    install -Dm755 \
        "${srcdir}/${_appimage}" \
        "${pkgdir}/usr/bin/runelite-launcher"
}

