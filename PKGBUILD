# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=open-alert-viewer-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="Display server and network alerts from Prometheus, Nagios, Icinga or Zabbix"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/leaf-node/open_alert_viewer"
license=('MIT')
depends=('gtk3' 'gstreamer' 'gst-plugins-base-libs')
provides=('open-alert-viewer')
conflicts=('open-alert-viewer')
options=('!strip' '!debug')
source_x86_64=("open-alert-viewer-${pkgver}.deb::https://codeberg.org/leaf-node/open_alert_viewer/releases/download/v${pkgver}/open-alert-viewer-x86_64_${pkgver}-1ubuntu-noble.deb")
source_aarch64=("open-alert-viewer-${pkgver}.deb::https://codeberg.org/leaf-node/open_alert_viewer/releases/download/v${pkgver}/open-alert-viewer-aarch64_${pkgver}-1ubuntu-noble.deb")
sha256sums_x86_64=('fae8583259d8d7db603c3297836ba87d528f34aa27b21e3217b2493fa8866f2b')
sha256sums_aarch64=('b9314c34c34851b152d3ac5ba703f68f460f14d88249811679ac97f877e90636')

prepare() {
    cd "${srcdir}"
    bsdtar xf "open-alert-viewer-${pkgver}.deb"
    bsdtar xf data.tar.*
}

package() {
    # Install the application bundle
    install -dm755 "${pkgdir}/usr/lib/open-alert-viewer"
    cp -a "${srcdir}/usr/lib/open-alert-viewer/." "${pkgdir}/usr/lib/open-alert-viewer/"

    # Install the symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf ../lib/open-alert-viewer/open_alert_viewer "${pkgdir}/usr/bin/open_alert_viewer"

    # Install desktop file
    install -Dm644 "${srcdir}/usr/share/applications/studio.okcode.open_alert_viewer.desktop" \
        "${pkgdir}/usr/share/applications/studio.okcode.open_alert_viewer.desktop"

    # Install icons
    for size in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        if [ -f "${srcdir}/usr/share/icons/hicolor/${size}/apps/studio.okcode.open_alert_viewer.png" ]; then
            install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}/apps/studio.okcode.open_alert_viewer.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}/apps/studio.okcode.open_alert_viewer.png"
        fi
    done

    # Install SVG icon
    if [ -f "${srcdir}/usr/share/icons/hicolor/scalable/apps/studio.okcode.open_alert_viewer.svg" ]; then
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/studio.okcode.open_alert_viewer.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/studio.okcode.open_alert_viewer.svg"
    fi

    # Install license
    if [ -f "${srcdir}/usr/lib/open-alert-viewer/data/flutter_assets/LICENSE.md" ]; then
        install -Dm644 "${srcdir}/usr/lib/open-alert-viewer/data/flutter_assets/LICENSE.md" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    fi
}
