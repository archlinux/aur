# Maintainer: Raymond E. Hogenson <rayhogenson@gmail.com>

pkgname=slashem
pkgver=0.0.7E7F3
pkgrel=3
pkgdesc='Nethack variant Super Lotsa Added Stuff Hack - Extended Magic'
arch=('i686' 'x86_64')
url="http://www.slashem.org/"
license=('custom')
depends=('bash')
source=("http://prdownloads.sourceforge.net/$pkgname/se007e7f3.tar.gz"
	"$pkgname-$pkgver.patch")
md5sums=('54b4534fe85f08722e8b6b38d52c2e9a'
         '81e685f77734d1a39a85d4d5d77add7c')

prepare() {
	cd "$pkgname-$pkgver"
	sh sys/unix/setup.sh
	patch -p0 -i "$srcdir/$pkgname-$pkgver.patch"
	sed -e "/^# define COMPRESS /s|/usr/bin/compress|$(which gzip)|" \
		-i include/config.h
}

build() {
	cd "$pkgname-$pkgver"
	make all
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir" install manpages
	sed -e "s|HACKDIR=$pkgdir/|HACKDIR=|" \
		-e 's|HACK=$HACKDIR|HACK=/usr/lib/slashem|' \
		-i $pkgdir/usr/bin/slashem
	install -Dm644 dat/license "$pkgdir/usr/share/licenses/$pkgname/license"
	install -dm755 "$pkgdir/usr/lib/$pkgname"
	mv "$pkgdir"/var/games/slashem/{slashem,recover} \
		"$pkgdir/usr/lib/$pkgname"
}

