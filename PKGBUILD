# Maintainer: snogard <snogardb at gmail dot com>

pkgname=edex-ui-appimage
pkgver=2.2.8
pkgrel=1
pkgdesc='A cross-platform, customizable science fiction terminal emulator with advanced monitoring & touchscreen support.'
arch=('x86_64' 'aarch64')
url=https://github.com/GitSquared/edex-ui
license=(GPL3)

depends=(
    'hicolor-icon-theme'
    'zlib'
)

provides=(
    'edex-ui'
)

source=(
    "${url}/releases/download/v${pkgver}/eDEX-UI-Linux-x86_64.AppImage"
    "${url}/releases/download/v${pkgver}/eDEX-UI-Linux-arm64.AppImage"
)
sha256sums=('c8f28cd721ca032ca0c1960b756ca3e64dc441a643c32eafbb79c673b402d681'
            '1afe0146c312dc9fde1c569ed370cbcdc82ba4282ae372a7921cd6dfc9462236')
options=(!strip)

prepare() {
    _arch=$(uname -m)
    mv eDEX-UI-Linux-arm64.AppImage eDEX-UI-Linux-aarch64.AppImage

    chmod +x eDEX-UI-Linux-${_arch}.AppImage
    ./eDEX-UI-Linux-${_arch}.AppImage --appimage-extract

    sed -i "s/AppRun/env DESKTOPINTEGRATION=false \/usr\/bin\/edex-ui/" "${srcdir}/squashfs-root/edex-ui.desktop"
}

package() {
    _arch=$(uname -m)

    install -Dm755 eDEX-UI-Linux-${_arch}.AppImage ${pkgdir}/opt/edex-ui/eDEX-UI.AppImage

    install -dm755 ${pkgdir}/usr/bin
    ln -s /opt/edex-ui/eDEX-UI.AppImage ${pkgdir}/usr/bin/edex-ui

    install -dm755 ${pkgdir}/usr/share/applications/
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/edex-ui.desktop" "${pkgdir}/usr/share/applications/"
}
