# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Winston Weinert (winny) <winston@ml1.net>

pkgname=slashem
pkgver=0.0.7E7F3
pkgrel=7
pkgdesc='Nethack variant Super Lotsa Added Stuff Hack - Extended Magic'
arch=('i686' 'x86_64')
url="http://www.slashem.org/"
license=('custom')
depends=('bash')
source=("http://downloads.sourceforge.net/project/slashem/slashem-source/0.0.7E7F3/se007e7f3.tar.gz"
	      "$pkgname-$pkgver.patch")
sha512sums=('47d1fd03cf322991eb4a5c20bb8885339ff1810bbe5870304e0400fec72b374ff8a857369a6bc0a913f86da8448b3e9af25a33d148c98a427794413a7edb1281'
            'a515ad451bcc7e85c64206be7136a645547846ba19976336cf4afa91794c16baa17a6529a032569c95c962127c87c1cb86ce2641bbb5482a52895244be920887')

MAKEFLAGS='-j1' # 28-March-2017: Apparent fix for slashem build issues.

prepare() {
	cd "$pkgname-$pkgver"
	sh sys/unix/setup.sh
	patch -p0 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make all
}

package() {
	cd "$pkgname-$pkgver"
	install -dm755 "$pkgdir"/usr/share/man/{fr/man6,man6}
	install -dm775 "$pkgdir/var/games"
	make PREFIX="$pkgdir" install manpages
	sed -e "s|HACKDIR=$pkgdir|HACKDIR=|" -e 's|HACK=$HACKDIR|HACK=/usr/lib/slashem|' -i $pkgdir/usr/bin/slashem
	install -Dm644 dat/license "$pkgdir/usr/share/licenses/$pkgname/license"
	install -dm755 "$pkgdir/usr/lib/$pkgname"
	mv "$pkgdir"/var/games/slashem/{slashem,recover} "$pkgdir/usr/lib/$pkgname"

	# Delete man pages that conflict with nethack.
	rm "$pkgdir"/usr/share/man/man6/{dgn_comp.6,dlb.6,lev_comp.6,recover.6}
}

