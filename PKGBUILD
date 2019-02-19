# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=touchpad-indicator-git
_pkgname=touchpad-indicator
_gitname=Touchpad-Indicator
pkgver=r95.48ab61a
pkgrel=1
pkgdesc="An indicator for the touchpad"
arch=('any')
url="https://www.atareao.es/aplicacion/touchpad-indicator-para-ubuntu"
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'libappindicator-gtk3' 'libnotify' 'gconf' 'librsvg' 'python-xlib' 'python-pyudev' 'python-dbus' 'xorg-xinput')
provides=("$_pkgname")
conflicts=("$_pkgname-bzr")
source=("git+https://github.com/atareao/$_gitname.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_gitname"
	install -Dm755 bin/$_pkgname $pkgdir/usr/bin/$_pkgname
	install -Dm644 debian/changelog $pkgdir/usr/share/$_pkgname/changelog
	install -Dm644 src/*.py $pkgdir/usr/share/$_pkgname
	install -d $pkgdir/usr/share/{$_pkgname/icons,glib-2.0/schemas}
	install -Dm644 data/icons/*.svg $pkgdir/usr/share/$_pkgname/icons
	install -Dm644 data/schemas/*.xml $pkgdir/usr/share/glib-2.0/schemas
	install -Dm755 data/00_check_touchpad_status $pkgdir/etc/pm/sleep.d/00_check_touchpad_status
	install -Dm755 data/00_check_touchpad_status_systemd $pkgdir/usr/lib/systemd/system-sleep/00_check_touchpad_status_systemd
	install -Dm644 data/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
	install -Dm644 data/$_pkgname-autostart.desktop $pkgdir/usr/share/$_pkgname/$_pkgname-autostart.desktop
	install -Dm644 data/icons/$_pkgname.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
	for icon_size in 8 16 32 48 96 128 192 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -Dm644 data/icons/${icon_size}x${icon_size}/$_pkgname.png $pkgdir$icons_dir/$_pkgname.png
	done
}
