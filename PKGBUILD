# Maintainer: jakob <grandchild@gmx.net>
# Contributor: James An <james@jamesan.ca>

pkgname=selfspy-git
_pkgname=${pkgname%-git}
pkgver=0.1.4.r202.ga98a9c0
pkgrel=2
epoch=1
pkgdesc="X11 personal keylogger daemon with statistical analysis."
url="https://github.com/gurgeh/selfspy"
install="$_pkgname.install"
changelog=.Changelog
license=('GPL')
arch=('i686' 'x86_64')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('python2-daemon'
		'python2-keyring'
		'python2-xlib'
		'python2-sqlalchemy'
		'tk'
		'python2-pycryptodome')
makedepends=('git')
source=("$_pkgname"::"git+https://github.com/gurgeh/$_pkgname.git"
		"$_pkgname.conf"
		"$_pkgname@.service"
		'pycryptodome.patch')
md5sums=('SKIP'
		'c19d0212e7c6c1fe90c6975da9937db2'
		'2874c55b09f87c946824dfdf4f60e1ed'
		'SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	sed -i 's/env python/env python2/g' $_pkgname/__init__.py
	sed -i 's:var/lib:usr/share:g' Makefile
	sed -i 's/pycrypto>=.\+/pycryptodome>=3.6.6/g' requirements.txt
    # Apply hacks to keep it working with pycryptodome
	patch -p1 < "$srcdir/pycryptodome.patch"
}

package() {
	cd $_pkgname
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 ../$_pkgname@.service $pkgdir/usr/lib/systemd/system/$_pkgname@.service
	install -Dm644 ../$_pkgname.conf $pkgdir/usr/share/$_pkgname/$_pkgname.conf.example
}
