# Maintainer: SanskritFritz (gmail)
# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmspaceclock
_prgname=spaceclock
pkgver=1.2d
pkgrel=8
pkgdesc="Dockapp showing antialiased analog clock."
url="http://$pkgname.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gdk-pixbuf')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$_prgname-$pkgver.tar.bz2")
md5sums=('97bcf9cc8a5518f8b37752beba9a7a9c')

prepare() {
	cd "$srcdir/$_prgname"
	sed -e '/$(CXX)/s,$(PRG),\$(PRG) \$(CPPFLAGS) \$(CXXFLAGS),' -i Makefile
	sed -e '/\/usr\/local/s,/usr/local,/usr,' -i Makefile
	sed -e '/-g3/s,-g3,-ggdb,' -i Makefile
	sed -e '/install -s/s,install -s,install,' -i Makefile
}

build() {
	cd "$srcdir/$_prgname"
	./configure \
	  X_LDFLAGS="-L/usr/lib -lgdk_pixbuf -lgdk -lX11 -lm -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now" \
	  CXXFLAGS="$CXXFLAGS -std=c++98 -Wno-write-strings -Wno-deprecated -Wno-return-type"
	make \
	  X_LDFLAGS="-L/usr/lib -lgdk_pixbuf -lgdk -lX11 -lm -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now" \
	  CXXFLAGS="$CXXFLAGS -std=c++98 -Wno-write-strings -Wno-deprecated -Wno-return-type"
}

package() {
	cd "$srcdir/$_prgname"
	mkdir -p "$pkgdir/usr/bin"
	rm --recursive pixmaps/CVS
	make DESTDIR="$pkgdir" install
}
