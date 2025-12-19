# Maintainer: Shira Nguyen <sn3446409@gmail.com>

pkgname=xenia-edge-bin
pkgver=9bc8551
pkgrel=1
pkgdesc="Fork of the Xenia emulator based on Xenia Canary, with aims for quicker iterations and improvements on Vulkan and Linux support."
arch=('x86_64')
url="https://github.com/has207/xenia-edge/"
license=('BSD-3-Clause')
depends=('zlib')
options=(!strip)
provides=('xenia' 'xenia-edge')
source=("xenia-edge-${pkgver}.AppImage::https://github.com/has207/xenia-edge/releases/download/${pkgver}/xenia_edge_linux.AppImage"
        "https://raw.githubusercontent.com/has207/xenia-edge/${pkgver}/LICENSE")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    chmod +x xenia-edge-${pkgver}.AppImage
    ./xenia-edge-${pkgver}.AppImage --appimage-extract
}

build() {
    # Normalize permissions
    chmod -R a-x+rX squashfs-root/usr

    # Retrieve desktop files and icons and delete the rest
    mv ${srcdir}/squashfs-root/usr/share/applications/xenia_edge.desktop ${srcdir}/xenia_edge.desktop
    mv ${srcdir}/squashfs-root/usr/share/icons ${srcdir}/icons
    rm -rf ${srcdir}/squashfs-root/

    # Modify the desktop file just to be safe
    sed -i -E \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/xenia_edge|" \
        -e "s|Exec=xenia_edge|Exec=env DESKTOPINTEGRATION=false /usr/bin/xenia_edge|" \
        "${srcdir}/xenia_edge.desktop"

}

package() {
    mkdir -p "${pkgdir}/opt/xenia-edge"

    # Install AppImage
    install -Dm755 "${srcdir}/xenia-edge-${pkgver}.AppImage" "${pkgdir}/opt/xenia-edge/xenia-edge.AppImage"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/xenia-edge/xenia-edge.AppImage" "${pkgdir}/usr/bin/xenia_edge"

    # Create desktop entry and install icons
    install -Dm644 "${srcdir}/xenia_edge.desktop" "${pkgdir}/usr/share/applications/xenia_edge.desktop"
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/icons" "${pkgdir}/usr/share/"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/xenia-edge/LICENSE"
    install -dm755 "${pkgdir}/usr/share/licenses/xenia-edge/"
    ln -s "/opt/xenia-edge/LICENSE" "$pkgdir/usr/share/licenses/xenia-edge"
}
