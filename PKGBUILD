# Maintainer: TODO <TODO>
pkgname=qgroundcontrol-bin
pkgver=5.0.8
pkgrel=1
pkgdesc='Cross-platform ground control station for MAVLink drones (extracted from official AppImage)'
arch=('x86_64')
url='https://github.com/mavlink/qgroundcontrol'
license=('Apache-2.0 OR GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libglvnd' 'libx11' 'libxcb' 'wayland' 'hicolor-icon-theme')
optdepends=('speech-dispatcher: text-to-speech announcements')
provides=('qgroundcontrol')
conflicts=('qgroundcontrol')
options=('!strip' '!debug')
install="$pkgname.install"

_appimage="QGroundControl-${pkgver}-x86_64.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/QGroundControl-x86_64.AppImage")
sha256sums=('06969c67ef58ea063def0a8271447a1cc385438c4a7df36813315b4475146737')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract > /dev/null
}

package() {
    # Install the extracted AppDir to /opt
    install -d "$pkgdir/opt"
    cp -dr --no-preserve=ownership squashfs-root "$pkgdir/opt/qgroundcontrol"

    # Trim dev headers and bundled docs not useful in a binary package
    rm -rf "$pkgdir/opt/qgroundcontrol/usr/include" \
           "$pkgdir/opt/qgroundcontrol/usr/share/doc"

    # AppRun resolves APPDIR from its own real path, so a symlink suffices
    install -d "$pkgdir/usr/bin"
    ln -s /opt/qgroundcontrol/AppRun "$pkgdir/usr/bin/qgroundcontrol"

    # Desktop entry, pointed at the /usr/bin launcher
    install -Dm644 squashfs-root/usr/share/applications/org.mavlink.qgroundcontrol.desktop \
        "$pkgdir/usr/share/applications/org.mavlink.qgroundcontrol.desktop"
    sed -i 's/^Exec=.*/Exec=qgroundcontrol/' \
        "$pkgdir/usr/share/applications/org.mavlink.qgroundcontrol.desktop"

    # Icons (whichever sizes upstream actually ships)
    local icon
    for icon in squashfs-root/usr/share/icons/hicolor/*/apps/QGroundControl.png; do
        install -Dm644 "$icon" "$pkgdir/usr/share/${icon#squashfs-root/usr/share/}"
    done

    # AppStream metadata
    install -Dm644 squashfs-root/usr/share/metainfo/org.mavlink.qgroundcontrol.metainfo.xml \
        "$pkgdir/usr/share/metainfo/org.mavlink.qgroundcontrol.metainfo.xml"
}
