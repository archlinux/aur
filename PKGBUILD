# Maintainer: Einhard Leichtfuß <respiranto@icloud.com>
# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=dict-gcide
pkgver=0.48.1
pkgrel=6
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
md5sums=('44fa2d940c58e65635357fee76772a35')

build() {
	cd "$pkgname-$pkgver"
	export CPPFLAGS="-D_FORTIFY_SOURCE=0"
	./configure --with-local-libmaa --prefix=/usr
	make
	mkdir -p "../final_data"
	make dictdir="../final_data" install
	# fix wrong order:
	LANG=C sort --dictionary-order --ignore-case -o "../final_data"/gcide.index{,}
}

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp "final_data"/* "$pkgdir/usr/share/dictd/"
	mkdir -p "$pkgdir/usr/share/doc/dict-gcide"
	cp "$pkgname-$pkgver/cide/README.dic" "$pkgdir/usr/share/doc/dict-gcide/"
}
