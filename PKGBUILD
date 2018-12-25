# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xwxapt
_pkgname=apt
pkgver=3.4.2
pkgrel=1
pkgdesc="Ham Radio - Weather Satellite APT format image decoder using X/GTK+"
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/$pkgname/$pkgname.html"
license=(GPL)
depends=('gtk3' 'rtl-sdr' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
source=(http://www.qsl.net/5b4az/pkg/$_pkgname/$pkgname/$pkgname-$pkgver.tar.bz2
	$pkgname.desktop
	$pkgname.1
	xdemorse.png
	diff.Makefile.am
)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.Makefile.am
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

	mkdir -p $pkgdir/usr/share/doc/$pkgname/examples/
	mkdir -p $pkgdir/usr/share/man/man1/
	mkdir -p $pkgdir/usr/share/{$pkgname,applications,pixmaps}
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -Dm755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mv $pkgdir/usr/share/doc/$pkgname/$pkgname.1.gz $pkgdir/usr/share/man/man1/$pkgname.1.gz

	install -Dm644 $pkgname/xwxapt.glade $pkgdir/usr/share/$pkgname/xwxapt.glade
	install -Dm644 $pkgname/xwxaptrc $pkgdir/usr/share/doc/$pkgname/examples/xwxaptrc.example
	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 ../xdemorse.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('03eb85c9a8876cbeda21a22a2c8d7d99'
         '5b913f35d6cad963dec99c5fc0a0d5ad'
         'be4e387a7844b355742b622a48220f08'
         'edcd3f301ec8ea95453d40534beb6ede'
         '8b6dea74de28f7a6abbb2825eef521b7')
sha256sums=('a4d92cd966ae3bb466b603f1faa91566df3dcc30c067bc683d796284aa40be0e'
            '51671884532f68f9ededadbbdfdcd801827bc9b543ae5cb1b5c414336b7cab07'
            '43013c654e218d68232bb0ae53038f4d13fcfb63aca6002c54d9695f434f7b28'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d'
            'f938d59dd58219ae292927e2c49de6330f1f9ae07f55011bcba5b4e9804a9753')
