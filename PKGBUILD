# Maintainer: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Axper Jan <483ken _at_ gmail

_gitname=udis86

pkgname=$_gitname-git
pkgver=1.7.1.140.g8731227
pkgrel=1
pkgdesc="Disassembler library for x86"
arch=('i686' 'x86_64')
url="http://udis86.sourceforge.net/"
license=('BSD')
depends=()
makedepends=('git' 'python-sphinx')
provides=('udis86')
conflicts=('udis86')
source=(git://github.com/radare/$_gitname.git)
md5sums=(SKIP)

pkgver() {
	cd $srcdir/$_gitname

	# Use the tag of the last commit
	git describe --always | sed 's|-|.|g;s|^v||'
}

build() {
	cd $srcdir/$_gitname

	# Building...
	./autogen.sh
	./configure --prefix=/usr --with-python=/usr/bin/python2
	make
}

package() {
	cd $srcdir/$_gitname
	make DESTDIR=$pkgdir install

	# Taking care of the license
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# Docs
	cd docs/manual
	sphinx-build . $pkgdir/usr/share/doc/$_gitname
}
