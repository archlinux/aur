# Maintainer - main package: Kyle Keen <keenerd@gmail.com>
# Maintainer - i3wm fork: Jan Zelenka <3yanyanyan@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=xnec2c-i3wm
pkgver=4.1.1
pkgrel=1
pkgdesc="GTK+ Antenna EM Modeling Client - patched to be I3wm compatible"
arch=('i686' 'x86_64')
#url="http://5b4az.chronos.org.uk/pages/nec2.html"
#url="http://web.archive.org/web/20110724184011/http://5b4az.chronos.org.uk/pages/nec2.html"
url="http://www.qsl.net/5b4az/pkg/nec2/xnec2c/doc/xnec2c.html"
license=('GPL')
depends=('gtk2')
optdepends=('gnuplot: to use plotted output/data files')
provides=('xnec2c')
conflicts=('xnec2c')
#source=(http://5b4az.chronos.org.uk/pkg/nec2/$pkgname/$pkgname-$pkgver.tar.bz2
#source=(http://pkgs.fedoraproject.org/repo/pkgs/$pkgname/$pkgname-$pkgver.tar.bz2/d3c1d34da5519cf66ff429de51c6c768/$pkgname-$pkgver.tar.bz2
_pkgname=xnec2c
source=("donthide.patch"
        "http://www.qsl.net/5b4az/pkg/nec2/xnec2c/xnec2c-$pkgver.tar.bz2"
        "$_pkgname.desktop"
        "http://bjensen.fedorapeople.org/pkgs/hams/icon/Ham_Icon-1-48.png")
md5sums=('SKIP'
         'ad8e922388dc364c113f3ac06d4eddf3'
         '824c296ecb84175a5fa0905b8f357796'
         '38378f273628bd9a28d3e5f9ff39fa18')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver/src"
    patch --strip=0 "--input=${srcdir}/donthide.patch"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	# or add AC_SEARCH_LIBS(clogl, m) to configure.in
	sed -i 's/1.14/1.15/g' {autogen.sh,aclocal.m4}
	./autogen.sh
	./configure --prefix=/usr LDFLAGS=-lm
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share/$_pkgname/"{doc/images,examples}
	mkdir -p "$pkgdir/usr/share/"{applications,pixmaps}

	make DESTDIR="$pkgdir" install

	install -m644 doc/images/* "$pkgdir/usr/share/$_pkgname/doc/images"
	rm -r doc/images
	install -m644 doc/* "$pkgdir/usr/share/$_pkgname/doc"
	install -m644 examples/* "$pkgdir/usr/share/$_pkgname/examples"
	install -m644 ../*.desktop "$pkgdir/usr/share/applications/"
	install -m644 ../Ham_Icon-1-48.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}

