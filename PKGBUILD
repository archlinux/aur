# Maintainer: clack <997536907@qq.com>
# Upstream does not provide an Arch package; this wraps the official
# prebuilt AppImage from the v0.6.0 GitHub release.
pkgname=wifi-heatmapper-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Measure Wi-Fi signal strength and throughput and draw heat maps on a floor plan (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/hnykda/wifi-heatmapper"
license=('MIT')
depends=('fuse2' 'webkit2gtk-4.1' 'networkmanager' 'iw')
optdepends=('iperf3: throughput (speed) measurement against an iperf3 server')
provides=('wifi-heatmapper')
conflicts=('wifi-heatmapper')
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/hnykda/wifi-heatmapper/releases/download/v${pkgver}/WiFi.Heatmapper_${pkgver}_amd64.AppImage")
sha256sums_x86_64=('6851e967f9669dabea496ecd91e4744950a598df0c23a5687f7048cf5abbec2a')
options=('!strip')

package() {
    cd "${srcdir}"
    local _appimage="${pkgname}-${pkgver}.AppImage"

    # AppImage itself goes to /opt
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Executable on PATH (matches the desktop file's Exec=)
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/wifi-heatmapper"

    # Extract desktop file and icons from inside the AppImage.
    # Note: the top-level "WiFi Heatmapper.desktop" is a symlink; the real
    # file lives under usr/share/applications/, so extract that path.
    ./"${_appimage}" --appimage-extract "usr/share/applications/*.desktop" > /dev/null
    for _size in 32x32 128x128 256x256@2; do
        ./"${_appimage}" --appimage-extract "usr/share/icons/hicolor/${_size}/apps/wifi-heatmapper.png" > /dev/null
    done

    install -Dm644 "squashfs-root/usr/share/applications/WiFi Heatmapper.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # GTK title-cases the Wayland app_id (observed resourceClass is
    # "Wifi-heatmapper"); match it exactly so the taskbar/window icon resolves
    sed -i 's|^StartupWMClass=.*|StartupWMClass=Wifi-heatmapper|' \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _size in 32x32 128x128 256x256@2; do
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/${_size}/apps/wifi-heatmapper.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/wifi-heatmapper.png"
    done
}
