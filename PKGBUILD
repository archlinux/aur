# Maintainer: clack <997536907@qq.com>
# Upstream does not provide an Arch package; this wraps the official
# prebuilt AppImage from the v0.6.0 GitHub release.
pkgname=wifi-heatmapper-bin
pkgver=0.6.0
pkgrel=2
pkgdesc="Measure Wi-Fi signal strength and throughput and draw heat maps on a floor plan (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/hnykda/wifi-heatmapper"
license=('MIT')
depends=('fuse2' 'webkit2gtk-4.1' 'networkmanager' 'iw')
optdepends=('iperf3: throughput (speed) measurement against an iperf3 server')
provides=('wifi-heatmapper')
conflicts=('wifi-heatmapper')
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/hnykda/wifi-heatmapper/releases/download/v${pkgver}/WiFi.Heatmapper_${pkgver}_amd64.AppImage")
sha256sums_x86_64=('e43c5311baa827daa09af323bbce1f22fecbdbfa05ff39b8e3cc935c2561fbd5')
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
