# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=battery-monitor-git
_gitname=battery-monitor
pkgver=0.6.r19.g8754ddf
pkgrel=2
pkgdesc='A utility tool, notifies user about charging, discharging and not charging state of the battery on Linux.'
arch=('any')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python' 'python-gobject' 'libnotify' 'libappindicator-gtk3')
makedepends=('python-setuptools')
provides=('battery-monitor')
source=('git+https://github.com/maateen/battery-monitor.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_gitname"
    sed -e 's|%EXEC_PATH%|/usr/bin/battery-monitor|' \
            -e 's|%ICON_PATH%|/usr/share/pixmaps/battery-monitor.png|' \
            battery-monitor.desktop.in > battery-monitor.desktop
    sed -e 's|%EXEC_PATH%|/usr/bin/battery-monitor|' \
            -e 's|%ICON_PATH%|/usr/share/pixmaps/battery-monitor.png|' \
            battery-monitor-autostart.desktop.in > battery-monitor-autostart.desktop

}

build() {
	cd "$srcdir/$_gitname"
    python setup.py build
}

package() {
	cd "$srcdir/$_gitname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$_gitname-autostart.desktop" "$pkgdir/etc/xdg/autostart/$_gitname-autostart.desktop"
	install -Dm644 "$_gitname.desktop" "$pkgdir/usr/share/applications/$_gitname.desktop"
	install -Dm644 battery_monitor/icons/icon.png "$pkgdir/usr/share/pixmaps/$_gitname.png"
}
