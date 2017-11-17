# Maintainer: Lu Stadler <lu@papill0n.org>
pkgname="cudd"
pkgver="3.0.0"
pkgrel=1
pkgdesc="A package for the manipulation of Binary Decision Diagrams (BDDs) and similar structures"
arch=('i686' 'x86_64')
url="http://vlsi.colorado.edu/~fabio/CUDD"
license=('BSD')
depends=(gcc-libs)
makedepends=()
source=("ftp://vlsi.colorado.edu/pub/$pkgname-$pkgver.tar.gz")
md5sums=('4fdafe4924b81648b908881c81fe6c30')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-shared --enable-dddmp --enable-obj
	#grep -lR util.h | xargs sed -i 's/util.h/cudd-util.h/g'
	#mv util/util.h util/cudd-util.h
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	#cp util/cudd-util.h $pkgdir/usr/include
	cp util/util.h $pkgdir/usr/include
	#sed -i 's/config.h/cudd-config.h/g' $pkgdir/usr/include/cudd-util.h
	sed -i 's/config.h/cudd-config.h/g' $pkgdir/usr/include/*.h
	cp config.h $pkgdir/usr/include/cudd-config.h

	cp mtr/mtr.h $pkgdir/usr/include

	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
