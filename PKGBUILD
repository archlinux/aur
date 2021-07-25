# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=xnec2c
pkgver=4.1.5
pkgrel=1
pkgdesc="GTK+ Antenna EM Modeling Client"
arch=('i686' 'x86_64')
#url="http://5b4az.chronos.org.uk/pages/nec2.html"
#url="http://web.archive.org/web/20110724184011/http://5b4az.chronos.org.uk/pages/nec2.html"
url="http://www.qsl.net/5b4az/pkg/nec2/xnec2c/doc/xnec2c.html"
license=('GPL')
depends=('gtk2')
optdepends=('gnuplot: to use plotted output/data files')
#source=(http://5b4az.chronos.org.uk/pkg/nec2/$pkgname/$pkgname-$pkgver.tar.bz2
#source=(http://pkgs.fedoraproject.org/repo/pkgs/$pkgname/$pkgname-$pkgver.tar.bz2/d3c1d34da5519cf66ff429de51c6c768/$pkgname-$pkgver.tar.bz2
source=("http://www.qsl.net/5b4az/pkg/nec2/xnec2c/xnec2c-$pkgver.tar.bz2"
        "$pkgname.desktop"
        "http://bjensen.fedorapeople.org/pkgs/hams/icon/Ham_Icon-1-48.png")
md5sums=('b2fecab6c6890141f1a1503484e0e5b5'
         '824c296ecb84175a5fa0905b8f357796'
         '38378f273628bd9a28d3e5f9ff39fa18')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# weird error where it installs the file to a location it won't read from?
	sed -i 's|"/.xnec2c/xnec2c.glade"|"/.xnec2c/xnec2c/xnec2c.glade"|' src/main.c
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	# or add AC_SEARCH_LIBS(clogl, m) to configure.in
	sed -i 's/1.14/1.15/g' {autogen.sh,aclocal.m4}
	./autogen.sh
	./configure --prefix=/usr LDFLAGS=-lm
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share/"{applications,pixmaps}

	make DESTDIR="$pkgdir" install

	# 4.1.2's improved install doesn't do these
	install -m644 examples/* "$pkgdir/usr/share/examples/$pkgname/"

	# check if the upstream desktop can replace ours
	install -m644 ../*.desktop "$pkgdir/usr/share/applications/"
	install -m644 ../Ham_Icon-1-48.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

