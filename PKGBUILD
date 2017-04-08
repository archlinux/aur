# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=dict-gcide
pkgver=0.48.1
pkgrel=7
pkgdesc="GNU version of the Collaborative International Dictionary of English for dictd et al."
arch=('any')
url="http://www.dict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
provides=('dictd-gcide')
conflicts=('dictd-gcide')
install=$pkgname.install
source=("ftp://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.gz")
sha512sums=('87a5aae9952316e03e029424de06e36bec46ce1a24dd300eecaf73577f6785c18cbade1d4227ac38b505a8b64ad36bac64893f4a7dc25b87760df0a4e384fbc4')

build() {
	cd "$pkgname-$pkgver"
	export CPPFLAGS="-D_FORTIFY_SOURCE=0"
	./configure --with-local-libmaa --prefix=/usr
	make -j1
	mkdir "../final_data"
	make dictdir="../final_data" install
	# Fix wrong order.
	LANG=C sort --dictionary-order --ignore-case -o "../final_data"/gcide.index{,}
}

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp "final_data"/* "$pkgdir/usr/share/dictd/"
	mkdir -p "$pkgdir/usr/share/doc/dict-gcide"
	cp "$pkgname-$pkgver/cide/README.dic" "$pkgdir/usr/share/doc/dict-gcide/"
}
