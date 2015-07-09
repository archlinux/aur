# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>
pkgname='cvs2svn'
pkgver='2.4.0'
pkgrel='2'
pkgdesc='A migration tool for CVS to SVN/Git/Hg/Bzr'
arch=('any')
url='http://cvs2svn.tigris.org/'
license=('custom')
depends=('python2')
changelog=Changelog
source=("${url}files/documents/1462/49237/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a6677fc3e7b4374020185c61c998209d691de0c1b01b53e59341057459f6f116')

prepare() {
	cd $srcdir/$pkgname-$pkgver

	# python2 fix
	for file in $(find . -name '*.py' -print); do
		sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
		sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
	done
	sed -i 's/env python/env python2/' cvs2{bzr,git,svn} contrib/cvs2svn*
}

build() {
	cd $srcdir/$pkgname-$pkgver
	make man
}

package() {
	cd $srcdir/$pkgname-$pkgver

	python2 ./setup.py install --root=$pkgdir --optimize=1

	# license
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# man pages
	install -dm755 $pkgdir/usr/share/man/man1
	install -m644 *.1 $pkgdir/usr/share/man/man1

	# examples
	install -dm755 $pkgdir/usr/share/doc/$pkgname/examples
	install -m644 cvs2*-example* $pkgdir/usr/share/doc/$pkgname/examples

	# contrib
	install -dm755 $pkgdir/usr/share/doc/$pkgname/contrib
	install -m755 contrib/* $pkgdir/usr/share/doc/$pkgname/contrib

	# documentation
	install -dm755 $pkgdir/usr/share/doc/$pkgname
	install -m644 \
		BUGS \
		CHANGES \
		COMMITTERS \
		HACKING \
		README \
		$pkgdir/usr/share/doc/$pkgname

	# developer docs?
	install -dm755 $pkgdir/usr/share/doc/$pkgname/doc
	install -m644 doc/* $pkgdir/usr/share/doc/$pkgname/doc

	# html docs
	install -dm755 $pkgdir/usr/share/doc/$pkgname/www
	install -m644 www/*.html $pkgdir/usr/share/doc/$pkgname/www
}

