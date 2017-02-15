# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Maintainer: qs9rx <that nick at enjoys döt it>
# Original Contributor: Bob Finch <w9ya@arrl.net>
# Original author: Bennett Goble <nivardus at gmail dot com>

pkgname=xdemorse
pkgver=2.9
pkgrel=5
pkgdesc="An X/GTK+ application - decodes Morse Code signals into text."
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/morse/xdemorse/xdemorse.html"
license=(GPL)
depends=('gtk2' 'alsa-lib' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'imagemagick' 'pkg-config')
source=("http://www.qsl.net/5b4az/pkg/morse/$pkgname/$pkgname-$pkgver.tar.bz2"
	diff.autogen.sh
	$pkgname.desktop
	$pkgname.1
)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.autogen.sh
	sed -i s:xpm:png: Makefile.am
	convert files/$pkgname.xpm files/$pkgname.png
	install -m644 ../$pkgname.desktop files/$pkgname.desktop
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

	make check
}

package() {
	cd $srcdir/$pkgname-$pkgver

	mkdir -p $pkgdir/usr/share/doc/$pkgname/examples/
	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname
}
md5sums=('2a4a240f958fa58b6e09854b1f444125'
         'ad6b0e6dd69c1d0efd01efef63ace093'
         'abb9f6e6510c9f747d70c738eeb5a824'
         'd7f9056699f4467fd1ee6834b75cbed8')
sha256sums=('ef14e40f220ba35f0d65da46ec061ac19a742bfb3f7cbf55991c1aa8f9593058'
            'cc38902be0fc1026cc027cd0fdab7e78bbfb336df36b90b8f25060775636924a'
            '1a690f6c7fdb73be3ebcedb59390faf74fcfb5f71484290d9d5a682650d3c9b1'
            'ff51f11e00b872469a86d297a008b26ccad90a066d19397361e16e0b15ecb68c')
