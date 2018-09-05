# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=battery-monitor-git
pkgver=0.6.r15.g42d02b2
pkgrel=2
pkgdesc='A utility tool, notifies user about charging, discharging and not charging state of the battery on Linux.'
arch=('x86_64')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python' 'python-setuptools' 'libnotify' 'libappindicator-gtk3')
conflicts=('battery-monitor' 'battery-monitor-devel-git')
provides=('battery-monitor')
source=("$pkgname"::'git+https://github.com/maateen/battery-monitor.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname}"
    sed -e 's|%EXEC_PATH%|/usr/bin/battery-monitor|' \
            -e 's|%ICON_PATH%|/usr/share/pixmaps/battery-monitor.png|' \
            battery-monitor.desktop.in > battery-monitor.desktop
    sed -e 's|%EXEC_PATH%|/usr/bin/battery-monitor|' \
            -e 's|%ICON_PATH%|/usr/share/pixmaps/battery-monitor.png|' \
            battery-monitor-autostart.desktop.in > battery-monitor-autostart.desktop

}

package() {
	cd "$srcdir/${pkgname}"
	python setup.py install --root="$pkgdir/"
	install -Dm755 battery-monitor-autostart.desktop "${pkgdir}/etc/xdg/autostart/battery-monitor-autostart.desktop"
	install -Dm755 battery-monitor.desktop "${pkgdir}/usr/share/applications/battery-monitor.desktop"
	install -Dm644 battery_monitor/icons/icon.png "${pkgdir}/usr/share/pixmaps/battery-monitor.png"
}
