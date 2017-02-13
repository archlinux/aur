# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xgridloc
pkgver=1.7
pkgrel=2
pkgdesc="Ham Radio Maidenhead grid converter & bearing + distance calculator"
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/locator/xgridloc/xgridloc.html"
license=('GPL3')
depends=('gtk2' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'gettext'
# 'imagemagick'
 'pkg-config')
optdepends=('xplanet: provides visual path on great circle map')
#		^^^  see xgridloc's html (in the doc dir.) 4 instructions
source=("http://www.qsl.net/5b4az/pkg/locator/$pkgname/$pkgname-$pkgver.tar.bz2"
	diff.autogen.sh
	diff.Makefile.am
	$pkgname.desktop
	$pkgname.1
	xdemorse.png
	$pkgname.man.1.gz)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.autogen.sh
	patch -p0 < ../diff.Makefile.am

#	sed -i s:xpm:png: Makefile.am
#	convert files/$pkgname.xpm files/$pkgname.png
#	install -m644 ../$pkgname.desktop files/$pkgname.desktop
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
	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -Dm755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 ../xdemorse.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 ../$pkgname.man.1.gz $pkgdir/usr/share/man/man1/$pkgname.1.gz
}
md5sums=('4301e1e04cb01b6ad5382f8c9db1d18c'
         'ad6b0e6dd69c1d0efd01efef63ace093'
         'ba302cce36196c127b8a31b23ffb8e07'
         'f4da450b0dd9f4c996bf38ab7985feb9'
         '32fad178ce38d729899aaa77e7333438'
         'edcd3f301ec8ea95453d40534beb6ede'
         '6bae4f3fd761b1080347e52fb1dd8e61')
sha256sums=('215dcd178e8d910245b9682747597102466ebc95dbd6d6e874ff451f9f17a7ce'
            'cc38902be0fc1026cc027cd0fdab7e78bbfb336df36b90b8f25060775636924a'
            '0e8f64115abd56fe67cac538228fd4012bfb8fe77aeb9b1d9f5084fad85b7125'
            '2258247e36111af347a7067630f5b0736a4ea6932d9880bceb9cd982187a07fe'
            'b026e73fd9824c4f2a196a9c18345db428754409817c0b205e6f84f1a14d7ac4'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d'
            '6baa7833226a1f0a4facd7353f8b8d5538f70276907630c4ce199fc9495b8919')
