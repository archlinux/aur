# Maintainer: jakob <grandchild@gmx.net>
# Contributor: James An <james@jamesan.ca>

pkgname=selfspy-git
_pkgname=${pkgname%-git}
pkgver=0.1.4.r194.gb0be0ab
pkgrel=3
epoch=1
pkgdesc="X11 personal keylogger daemon with statistical analysis."
url="https://github.com/gurgeh/selfspy"
install="$_pkgname.install"
changelog=.Changelog
license=('GPL')
arch=('i686' 'x86_64')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('python2'
		'python2-daemon'
		'python2-lockfile'
		'python2-keyring'
		'python2-xlib'
		'python2-sqlalchemy'
		'tk'
		'pycrypto')
makedepends=('git')
source=("git://github.com/gurgeh/$_pkgname.git"
		"$_pkgname.conf"
		"$_pkgname@.service")
md5sums=('SKIP'
		'SKIP'
		'SKIP')

pkgver() {
	cd $srcdir/_pkgname
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd $srcdir/$_pkgname
	sed -i 's/env python/env python2/g' $_pkgname/__init__.py
	sed -i 's:var/lib:usr/share:g' Makefile
}

package() {
	cd $srcdir/$_pkgname
	install -d $pkgdir/usr/{bin,share/selfspy}
	install -d $pkgdir/usr/lib/systemd/system
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 ../$_pkgname@.service $pkgdir/usr/lib/systemd/system/
	install -Dm644 ../$_pkgname.conf $pkgdir/usr/share/$_pkgname/$_pkgname.conf.example
}
