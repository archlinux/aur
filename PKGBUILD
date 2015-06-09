# Maintainer: jakob <grandchild@gmx.net>

pkgname=selfspy-git
_pkgname=selfspy
pkgver=0.1.4.r169.g363aa5f
pkgrel=3
epoch=1
pkgdesc="X11 personal keylogger daemon with statistical analysis."
url="https://github.com/gurgeh/selfspy"
install=selfspy.install
changelog=.Changelog
license="GPL"
arch=('i686' 'x86_64')
provides=('selfspy')
conflicts=('selfspy')
depends=('python2'
		'python2-daemon'
		'python2-lockfile'
		'python2-keyring'
		'python2-xlib'
		'python2-sqlalchemy'
		'tk'
		'pycrypto')
makedepends=('git')
source=('git://github.com/gurgeh/selfspy.git'
		"${_pkgname}.conf"
		"${_pkgname}@.service")
md5sums=('SKIP'
		'SKIP'
		'SKIP')

pkgver() {
	cd $srcdir/${_pkgname}
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd $srcdir/${_pkgname}
	sed -i 's/env python/env python2/g' selfspy/__init__.py
	sed -i 's:var/lib:usr/share:g' Makefile
}

package() {
	cd $srcdir/${_pkgname}
	install -d $pkgdir/usr/{bin,share/selfspy}
	install -d $pkgdir/usr/lib/systemd/system
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 $srcdir/../${_pkgname}@.service \
		$pkgdir/usr/lib/systemd/system/
	install -Dm644 $srcdir/../${_pkgname}.conf \
		$pkgdir/usr/share/${_pkgname}/${_pkgname}.conf.example
}
