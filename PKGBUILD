# Maintainer: DonutsDelivery <megusta52@proton.me>
pkgname=donutmonitorcontrol
pkgver=2.7.1
pkgrel=1
pkgdesc="Control monitor brightness, color and input over DDC/CI, with sun-based auto brightness"
arch=('any')
url="https://github.com/DonutsDelivery/Auto-Brightness"
license=('MIT')
depends=('python' 'python-requests' 'python-pyqt6' 'qt6-declarative' 'kirigami'
         'ddcutil' 'qt6-tools' 'glib2' 'hicolor-icon-theme')
optdepends=('breeze: Breeze style used by the GUI'
            'edid-decode: improved fullscreen detection on multi-monitor setups'
            'plasma-desktop: KDE ScreenBrightness integration and KWin fullscreen detection'
            'python-dbus: GNOME Wayland fullscreen detection')
makedepends=('git')
provides=('monitor-remote-control')
conflicts=('monitor-remote-control')
replaces=('monitor-remote-control')
backup=('etc/donut-monitor-control/config.json')
source=("git+https://github.com/DonutsDelivery/Auto-Brightness.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/Auto-Brightness"

    # Entry points. They add /usr/share/donut-monitor-control to sys.path themselves.
    install -Dm755 auto_brightness.py "$pkgdir/usr/bin/donut-monitord"
    install -Dm755 brightness_kirigami_qt6.py "$pkgdir/usr/bin/donut-monitor"
    # Use the system Python: a pyenv or venv python3 earlier on PATH carries its own
    # PyQt6, which can't load the system Kirigami plugin.
    sed -i '1s|^#!.*python.*$|#!/usr/bin/python3|' "$pkgdir/usr/bin/donut-monitord" "$pkgdir/usr/bin/donut-monitor"

    # Modules and QML shared by both entry points
    local share="$pkgdir/usr/share/donut-monitor-control"
    install -Dm644 monitor_control.py "$share/monitor_control.py"
    install -Dm644 donut_monitor_common.py "$share/donut_monitor_common.py"
    install -Dm644 brightness_kirigami_qt6.qml "$share/brightness_kirigami_qt6.qml"

    # System default config. The first run copies it to ~/.config/donut-monitor-control/.
    install -Dm644 config.json "$pkgdir/etc/donut-monitor-control/config.json"

    # systemd user unit (runs the daemon)
    install -Dm644 donut-monitord.service "$pkgdir/usr/lib/systemd/user/donut-monitord.service"

    # i2c access for DDC/CI
    install -Dm644 udev/60-donut-monitor-i2c.rules "$pkgdir/usr/lib/udev/rules.d/60-donut-monitor-i2c.rules"
    install -Dm644 modules-load.d/donut-monitor-i2c.conf "$pkgdir/usr/lib/modules-load.d/donut-monitor-i2c.conf"
    install -Dm644 sysusers.d/donut-monitor-i2c.conf "$pkgdir/usr/lib/sysusers.d/donut-monitor-i2c.conf"

    # Desktop integration
    local appid=online.donutsdelivery.DonutMonitorControl
    install -Dm644 "data/$appid.desktop" "$pkgdir/usr/share/applications/$appid.desktop"
    install -Dm644 "data/$appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
    install -Dm644 "data/icons/$appid.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
    local size
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "data/icons/hicolor/${size}x${size}/apps/$appid.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$appid.png"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
