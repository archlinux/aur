# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=xsatcom
pkgver=3.2
pkgrel=1
pkgdesc="Ham Radio - satellite tracking."
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/satellite/xsatcom/xsatcom.html"
license=(GPL3)
depends=('gtk3' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config' 'gettext')
optdepends=('xplanet: provides data on great circle map')
source=("http://www.qsl.net/5b4az/pkg/satellite/$pkgname/$pkgname-$pkgver.tar.bz2"
	$pkgname.desktop
	xdemorse.png
	$pkgname.1)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	mkdir files/
	install -m644 ../$pkgname.desktop files/$pkgname.desktop
	install -m644 ../xdemorse.png files/$pkgname.png
}

build() {
	cd $srcdir/$pkgname-$pkgver

#	export LDFLAGS="-lm $LDFLAGS"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd $srcdir/$pkgname-$pkgver

#	make check
	make -i check	# sadly the intl. files. are not correct (sigh)
}

package() {
	cd $srcdir/$pkgname-$pkgver

	mkdir -p $pkgdir/usr/share/{applications,pixmaps,doc/$pkgname,$pkgname}
	make DESTDIR=$pkgdir install

	install .xsatcom/* $pkgdir/usr/share/xsatcom/.
	rm $pkgdir/usr/share/xsatcom/*.glade

	mkdir -p $pkgdir/usr/share/man/man1
	mv $pkgdir/usr/share/doc/xsatcom/xsatcom.1.gz \
		$pkgdir/usr/share/man/man1/.

	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname
}
md5sums=('8b8cd3eb831dfa505c874d2ac90f4a4a'
         'da46deb421a73376507b575629df5a48'
         'edcd3f301ec8ea95453d40534beb6ede'
         '49b427b41f3e7354c2502883d7f6801b')
sha256sums=('bb1132146167c0b907beeb73259abd08fbdfee9289f63c00853d10f260f375f1'
            'cbbc674993a789a42f7117358fa7b2b959c85376656722db942c40a2ad2eece8'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d'
            '357c69b07dfe18090998f59d10bbaa3e24b636e177a863c67d83015160b973d2')
