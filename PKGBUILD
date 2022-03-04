# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=xnec2c
pkgver=4.4.6
pkgrel=1
pkgdesc="GTK+ Antenna EM Modeling Client"
arch=('i686' 'x86_64')
url="https://www.xnec2c.org/"
license=('GPL')
depends=('gtk3')
optdepends=('gnuplot: to use plotted output/data files')
source=("$pkgname-$pkgver.tgz::https://github.com/KJ7LNW/xnec2c/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "http://bjensen.fedorapeople.org/pkgs/hams/icon/Ham_Icon-1-48.png")
md5sums=('1d36625ba3cffd9983e932494b1656d8'
         '824c296ecb84175a5fa0905b8f357796'
         '38378f273628bd9a28d3e5f9ff39fa18')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# weird error where it installs the file to a location it won't read from?
	#sed -i 's|"/.xnec2c/xnec2c.glade"|"/.xnec2c/xnec2c/xnec2c.glade"|' src/main.c
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	# or add AC_SEARCH_LIBS(clogl, m) to configure.in
	#sed -i 's/1.14/1.15/g' {autogen.sh,aclocal.m4}
	./autogen.sh
	./configure --prefix=/usr LDFLAGS=-lm
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	#mkdir -p "$pkgdir/usr/share/"{applications,pixmaps,examples/xnec2c}

	make DESTDIR="$pkgdir" install

	# 4.1.2's improved install doesn't do these
	#install -m644 examples/* "$pkgdir/usr/share/examples/$pkgname/"

	# check if the upstream desktop can replace ours
	install -m644 ../*.desktop "$pkgdir/usr/share/applications/"
	install -m644 ../Ham_Icon-1-48.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

