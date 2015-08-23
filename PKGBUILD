# Maintainer:  respiranto                  <respiranto@icloud.com>
# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=dict-gcide
pkgver=0.48.1
pkgrel=1
pkgdesc="GNU version of the Collaborative International Dictionary of English in dict format"
arch=('any')
url="http://www.dict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
replaces=('dictd-gcide')
install=$pkgname.install
source=("ftp://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.gz")
md5sums=('44fa2d940c58e65635357fee76772a35')

build() {
	cd "$pkgname-$pkgver"
	export CPPFLAGS="-D_FORTIFY_SOURCE=0"
	./configure --with-local-libmaa --prefix=/usr
	make
	mkdir -p "$srcdir/final_data"
	make dictdir="$srcdir/final_data" install
	# fix wrong order:
	LANG=C sort --dictionary-order --ignore-case -o "$srcdir/final_data"/gcide.index{,}
}

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	mv "$srcdir/final_data"/* "$pkgdir/usr/share/dictd/"
}
