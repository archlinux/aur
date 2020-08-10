# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xritty
pkgver=0.6
pkgrel=2
pkgdesc="Ham Radio RTTY engine using X/GTK+"
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/$pkgname/$pkgname.html"
license=(GPL)
depends=('gtk2' 'alsa-lib' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
source=(
http://www.qsl.net/5b4az/pkg/$pkgname/$pkgname-$pkgver.tar.bz2
	diff.Makefile.am
	$pkgname.desktop
	$pkgname.1
	xdemorse.png
#	$pkgname.man.1.gz
)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.Makefile.am
	sed -i -e s:'1.15':'1.16': autogen.sh
}

build() {
	cd $srcdir/$pkgname-$pkgver

#	export LDFLAGS="-lm $LDFLAGS"
#	It is possible 2 customize some entries in codec.h; See the docs.
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
#	install -Dm644 ../$pkgname.man.1.gz $pkgdir/usr/share/man/man1/$pkgname.1.gz
}
md5sums=('411dd1088c21fd12a069f878a8aa4479'
         '82186d72452d9f6798ba318ed0f44ab7'
         '7261882a40cc69a591aa03801c5f8328'
         'b78009cf3afb7bb234bac1a404bb721d'
         'edcd3f301ec8ea95453d40534beb6ede')
sha256sums=('43a926c0c67bb58370fe7c4188b9ee28288ecc8fbf2a90d0b4e3598823600a26'
            '015cf449e29d0fd9a72f9635638bd329b29150f5ef8fdc579a824c034ff12c09'
            'f839de258e9ecfb2b2f2e7dd2ceb7473014556928a0bd8c19d2d9a456bf998c6'
            'adffa49301d51abfbbd28552d43f44979783563f608a17e6571753471f343dd7'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d')
