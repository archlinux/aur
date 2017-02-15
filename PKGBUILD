# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Ruslan Nabioullin <rnabioullin@gmail.com>
# Contributor: Vitaliy Berdinskikh, aka UR6LAD <ur6lad@archlinux.org.ua>

pkgname=owx
pkgver=r21
#.266923b
pkgrel=2
pkgdesc="A CLI tool for programming Wouxun (KG669V,UVD1-3,UV1A, et al) HTs."
arch=('i686' 'x86_64')
url="http://owx.chmurka.net"
license=('Apache' 'custom:beerware')
depends=('gcc-libs')
makedepends=('git')
replaces=('wouxun')
source=("$pkgname-git::git://git.chmurka.net/$pkgname"
	LICENSE)
md5sums=('SKIP'
         '02ecf727fd7a0948393044fc17fc6f11')

pkgver() {
	cd "$srcdir/$pkgname-git/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" \
		| sed "s/\..*//"
}

prepare() {
	cd "$srcdir/$pkgname-git/"
	sed -i -e s:SVN:${pkgver}: src/version.h
	sed -i -e s:' help':' README': src/cmds.cc

	sed -i -e s:'local/':'': docs/README
	sed -i -e s:'libexec':'lib/owx': docs/README
}

build() {
	cd "$srcdir/$pkgname-git/"
	make
}

package() {
	mkdir -p $pkgdir/usr/{bin,lib/$pkgname}
	mkdir -p $pkgdir/usr/share/{doc/$pkgname,licenses/$pkgname}

	cd $srcdir
	install -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname

	cd "$srcdir/$pkgname-git/docs"
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
