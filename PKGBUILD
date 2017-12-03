# Contributor: Anton Leontiev <scileont /at/ gmail.com>
pkgname=lasercalc
pkgver=0.6
pkgrel=2
pkgdesc='A tool to calculate optical paths and resonators based on Gaussian beam matrix optics'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/lasercalc/'
license=('GPL3')
depends=('wxgtk')
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${pkgname}_$pkgver-1.tar.gz
	http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/libproperties-0.1.tar.gz
	http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/libsaf.0.1.tar.gz
	http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/libplot-0.6.tar.gz
	$pkgname.desktop
	$pkgname-$pkgver-libproperties.patch
	$pkgname-$pkgver-libsaf.patch
	$pkgname-$pkgver-libplot.patch
	$pkgname-$pkgver-build.patch)

md5sums=('ece7d77db1d95a07259a79172f80b250'
         '83b17c914f9a8f54484c806e20644823'
         '11dd24135f8200aff8e64cc499c7330e'
         '585ee9c4be758f172c8e72c297afcfa1'
         '73612ba4597ea5c4278390a42caa62ea'
         '6bc56b784452b40089e4d77b487b2582'
         '2325c4e7775d5c1099bff7e195b5e8ca'
         '12824bc49db77cf34c1a60447d923142'
         '587c7381386cbd3efde97e87d376d101')

build() {
	patch -p0 -i $pkgname-$pkgver-libproperties.patch
	patch -p0 -i $pkgname-$pkgver-libsaf.patch
	patch -p0 -i $pkgname-$pkgver-libplot.patch
	patch -p0 -i $pkgname-$pkgver-build.patch

	export CPPFLAGS="-I$srcdir/libs/include"
	export LDFLAGS="-L$srcdir/libs/lib"

	cd "$srcdir/properties-0.1"
	rm missing; autoreconf -i
	./configure --prefix="$srcdir/libs" --disable-shared
	make install

	cd "$srcdir/saf-0.1"
	rm missing; autoreconf -i
	./configure --prefix="$srcdir/libs" --disable-shared
	make install

	cd "$srcdir/plot-0.6"
	rm missing; autoreconf -i
	./configure --prefix="$srcdir/libs" --disable-shared
	make install

	cd "$srcdir/LaserCalc"
	rm missing; autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/LaserCalc"
	make DESTDIR="$pkgdir" install
	rm "$pkgdir/usr/share/title.htm"
	install -Dm644 src/lasercalc.xpm "$pkgdir/usr/share/pixmaps/lasercalc.xpm"
	install -Dm644 "$srcdir/lasercalc.desktop" "$pkgdir/usr/share/applications/lasercalc.desktop"
}
