# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=system76-hidpi-daemon-git
_pkgname=hidpi-daemon
pkgver=18.04.6.r0.gcfe8850
pkgrel=3
pkgdesc="Daemon to manage HiDPI and LoDPI monitors on X"
arch=('any')
url="https://github.com/pop-os/hidpi-daemon"
license=('GPL2')
depends=('python-pydbus' 'python-gobject' 'python-xlib' 'libnotify' 'acpid')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/hidpi-daemon.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm755 "$_pkgname" hidpi-notification prime-dialog -t \
		"$pkgdir/usr/lib/$_pkgname"
	install -Dm644 "$_pkgname.desktop" hidpi-frontend.desktop -t \
		"$pkgdir/etc/xdg/autostart"
	install -Dm644 com.system76.hidpi.gschema.xml -t \
		"$pkgdir/usr/share/glib-2.0/schemas"
	install -d "$pkgdir/var/lib/$_pkgname"
}
