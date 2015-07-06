# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Ruslan Nabioullin <rnabioullin@gmail.com>
# Contributor: Vitaliy Berdinskikh, aka UR6LAD <ur6lad@archlinux.org.ua>

pkgname=owx
pkgver=r17
pkgrel=1
pkgdesc="A CLI tool for programming KG669V (Wouxun) HTs."
arch=('i686' 'x86_64')
url="http://owx.chmurka.net"
license=('Apache' 'custom:beerware')
depends=('gcc-libs')
makedepends=('subversion')
replaces=('wouxun')
source=("$pkgname-svn::svn+http://svn.chmurka.net/$pkgname/trunk"
	LICENSE)
md5sums=('SKIP'
         '04c8deadd6984048760870d0fb397f25')

pkgver() {
	cd "$srcdir/$pkgname-svn/$pkgname"
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
	cd "$srcdir/$pkgname-svn/$pkgname"
	sed -i -e s:SVN:${pkgver}: src/version.h
	sed -i -e s:' help':' README': src/cmds.cc
}

build() {
	cd "$srcdir/$pkgname-svn/$pkgname"
	make
}

package() {
	mkdir -p $pkgdir/usr/{bin,lib/$pkgname}
	mkdir -p $pkgdir/usr/share/{doc/$pkgname,licenses/$pkgname}

	cd $srcdir
	install -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname

	cd "$srcdir/$pkgname-svn/$pkgname/docs"
	install -m 644 * $pkgdir/usr/share/doc/$pkgname
	rm  $pkgdir/usr/share/doc/$pkgname/LICENSE

	cd ../src
	install -D -m 755 $pkgname $pkgdir/usr/lib/$pkgname/$pkgname
	ln -sf ../lib/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname-check
	ln -sf ../lib/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname-get
	ln -sf ../lib/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname-put
	ln -sf ../lib/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname-export
	ln -sf ../lib/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname-import
	ln -sf ../lib/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname-fsk
}
