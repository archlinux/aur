# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=battery-monitor-git
pkgver=0.6.r19.g8754ddf
pkgrel=2
pkgdesc='A utility tool, notifies user about charging, discharging and not charging state of the battery on Linux.'
arch=('any')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python' 'python-gobject' 'libnotify' 'libappindicator-gtk3')
makedepends=('python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/maateen/battery-monitor.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -e 's|%EXEC_PATH%|/usr/bin/battery-monitor|' \
            -e 's|%ICON_PATH%|/usr/share/pixmaps/battery-monitor.png|' \
            battery-monitor.desktop.in > battery-monitor.desktop
    sed -e 's|%EXEC_PATH%|/usr/bin/battery-monitor|' \
            -e 's|%ICON_PATH%|/usr/share/pixmaps/battery-monitor.png|' \
            battery-monitor-autostart.desktop.in > battery-monitor-autostart.desktop
}

build() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "${pkgname%-git}-autostart.desktop" "$pkgdir/etc/xdg/autostart/${pkgname%-git}-autostart.desktop"
	install -Dm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 battery_monitor/icons/icon.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
