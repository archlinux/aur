# Maintainer: Ashutosh Padelkar <a dot padelkar 1 at gmail dot com>
pkgname=tempo2-cvs 
pkgver=2014.11.1
pkgrel=1
pkgdesc="Pulsar Timing Software"
arch=('i686' 'x86_64')
url="http://www.atnf.csiro.au/research/pulsar/tempo2"
license=('custom:AFL-2.1')
depends=('fftw' 'pgplot' 'atlas-lapack-base')
makedepends=('cvs') 
install=${pkgname}.install
provides=("${pkgname%-cvs}")
source=("AFL-2.1")
md5sums=('SKIP')
pkgver() {
	cvs history -c -a | cut -d' ' -f2 | sort -u | tail -n 1 | sed 's|-||g'	
}

prepare() {
	cvs -z3 -d:pserver:anonymous@tempo2.cvs.sourceforge.net:/cvsroot/tempo2 co tempo2
	cd "$srcdir/${pkgname%-cvs}"
}

build() {
	cd "$srcdir/${pkgname%-cvs}"
	./bootstrap
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-cvs}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-cvs}"
	make DESTDIR="$pkgdir/" install

	mkdir -pv "$pkgdir/opt/tempo2/T2runtime"
	cp -rv "$srcdir/tempo2/T2runtime" "$pkgdir/opt/tempo2/T2runtime"

	mkdir -pv "$pkgdir/usr/share/licenses/$pkgname"
	install -D -m644 "$srcdir/AFL-2.1" "$pkgdir/usr/share/licenses/${pkgname}/"
	install -D -m644 "$srcdir/${pkgname%-cvs}/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/"
}
