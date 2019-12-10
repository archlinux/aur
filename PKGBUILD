# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=battery-monitor-git
pkgver=0.6.r21.gfd1f4d7
pkgrel=1
pkgdesc="A utility tool, notifies user about charging, discharging and not
        charging state of the battery on Linux."
arch=('any')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python-gobject' 'libnotify' 'libappindicator-gtk3')
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
	sed -e 's|%EXEC_PATH%|battery-monitor|' \
		-e 's|%ICON_PATH%|battery-monitor|' \
		battery-monitor.desktop.in > battery-monitor.desktop
	sed -e 's|%EXEC_PATH%|battery-monitor|' \
		-e 's|%ICON_PATH%|battery-monitor|' \
		battery-monitor-autostart.desktop.in > battery-monitor-autostart.desktop
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "${pkgname%-git}-autostart.desktop" -t \
		"$pkgdir/etc/xdg/autostart"
	install -Dm644 "${pkgname%-git}.desktop" -t \
		"$pkgdir/usr/share/applications"
	install -Dm644 battery_monitor/icons/icon.png \
		"$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
