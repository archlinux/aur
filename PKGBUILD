# Maintainer: Keith Vassallo <keith@vassallo.cloud>
pkgname=smart-dnd
pkgver=0.1.0
pkgrel=1
pkgdesc="Automated Do Not Disturb based on schedules and calendar events for Linux desktops"
arch=('any')
url="https://github.com/keithvassallomt/smart-dnd-linux"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'evolution-data-server'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
optdepends=(
    'caelestia-cli: control Caelestia shell notifications'
    'swaync: control SwayNotificationCenter'
    'dunst: control Dunst'
)
conflicts=('smart-dnd-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1b1eeea3c0a9eca34b23642027e846135229cf0b8a3f06247543a85bd4c93b72')

build() {
    cd "${srcdir}/smart-dnd-linux-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/smart-dnd-linux-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 data/com.keithvassallo.SmartDnd.desktop "${pkgdir}/usr/share/applications/com.keithvassallo.SmartDnd.desktop"
    install -Dm644 data/com.keithvassallo.SmartDnd.metainfo.xml "${pkgdir}/usr/share/metainfo/com.keithvassallo.SmartDnd.metainfo.xml"
    # Start at login for every user; each user can switch it off in the GUI.
    install -Dm644 data/smart-dnd-autostart.desktop "${pkgdir}/etc/xdg/autostart/com.keithvassallo.SmartDnd.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install icons
    install -Dm644 data/icons/hicolor/scalable/apps/com.keithvassallo.SmartDnd.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.keithvassallo.SmartDnd.svg"
    install -Dm644 data/icons/hicolor/symbolic/apps/com.keithvassallo.SmartDnd-symbolic.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/com.keithvassallo.SmartDnd-symbolic.svg"

    for size in 16 32 48 64 128 256 512; do
        install -Dm644 data/icons/hicolor/${size}x${size}/apps/com.keithvassallo.SmartDnd.png \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/com.keithvassallo.SmartDnd.png"
    done
}
