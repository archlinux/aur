# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=touchpad-indicator-git
pkgver=r96.3ed32d6
pkgrel=1
pkgdesc="An indicator for the touchpad"
arch=('any')
url="https://github.com/atareao/Touchpad-Indicator"
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'libappindicator-gtk3' 'libnotify' 'lsb-release' 'gconf' 'librsvg' 'python-xlib' 'python-pyudev' 'python-dbus' 'python-evdev' 'xorg-xinput')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/atareao/Touchpad-Indicator.git")
sha256sums=('SKIP')

pkgver() {
	cd "Touchpad-Indicator"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "Touchpad-Indicator"
	install -Dm755 "bin/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 debian/changelog "$pkgdir/usr/share/${pkgname%-git}/changelog"
	install -Dm755 src/*.py "$pkgdir/usr/share/${pkgname%-git}"
	install -d $pkgdir/usr/share/{touchpad-indicator/icons,glib-2.0/schemas}
	install -Dm644 data/icons/*.svg "$pkgdir/usr/share/${pkgname%-git}/icons"
	install -Dm644 data/schemas/*.xml $pkgdir/usr/share/glib-2.0/schemas
	install -Dm755 data/00_check_touchpad_status $pkgdir/etc/pm/sleep.d/00_check_touchpad_status
	install -Dm755 data/00_check_touchpad_status_systemd $pkgdir/usr/lib/systemd/system-sleep/00_check_touchpad_status_systemd
	install -Dm644 "data/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 "data/${pkgname%-git}-autostart.desktop" "$pkgdir/usr/share/${pkgname%-git}/${pkgname%-git}-autostart.desktop"
	install -Dm644 "data/icons/${pkgname%-git}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
	for icon_size in 8 16 32 48 96 128 192 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -Dm644 "data/icons/${icon_size}x${icon_size}/${pkgname%-git}.png" "$pkgdir$icons_dir/${pkgname%-git}.png"
	done
}
