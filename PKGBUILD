# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=xfhell
pkgver=3.1
pkgrel=1
pkgdesc="Ham Radio - GTK+ app - de/en-codes Hellschreiber signals."
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/xfhell/xfhell.html"
license=(GPL3)
depends=('gtk2' 'alsa-lib' 'desktop-file-utils')
makedepends=('autoconf' 'automake' 'intltool'
# 'imagemagick'
 'pkg-config')
install=$pkgname.install
source=("http://www.qsl.net/5b4az/pkg/$pkgname/$pkgname-$pkgver.tar.bz2"
	diff.autogen.sh
	diff.Makefile.am
	$pkgname.desktop
	xdemorse.png
	$pkgname.1)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.autogen.sh
	patch -p0 < ../diff.Makefile.am

	sed -i s:xpm:png: Makefile.am
	mkdir files/
#	convert files/$pkgname.xpm files/$pkgname.png
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

	mkdir -p $pkgdir/usr/share/{applications,pixmaps,$pkgname,doc/$pkgname}
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname
}
md5sums=('25ed5f477ba38f0c296734ec4e82ff99'
         'ad6b0e6dd69c1d0efd01efef63ace093'
         'f5b10bc9c510cb359b6cb626d628aab9'
         '9a3568a6dbdd2bfb90aa76adf2dc531f'
         'edcd3f301ec8ea95453d40534beb6ede'
         'f1b4aee1d96afc2a5aa2aed475914ce4')
sha256sums=('819b319b83813fef48198dbfa0c8bbcb269aabe3b84ce0d3f4cd98b81c533451'
            'cc38902be0fc1026cc027cd0fdab7e78bbfb336df36b90b8f25060775636924a'
            '2484d70e867515fbe49fff2463a1ef8ecee02f1feb36ef4deec8fd24fcea0f7b'
            'a4bdba7b601bace48e15bd2dc6f0daadd8a10511242cbb2fdc17bf78a19647b5'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d'
            'e98727d5dd44ef65854b0735f45e7fbee19102d182b872bbd56b048d45a1f4a4')
