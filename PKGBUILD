# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=chbg
pkgver=1.5
pkgrel=6
pkgdesc="Periodically change background image in X11. Can be a slideshow screensaver too"
arch=('i686' 'x86_64')
url="http://chbg.sourceforge.net/about.html"
license=('GPL')
depends=('gtk2' 'imlib2')
source=(http://downloads.sourceforge.net/chbg/$pkgname-$pkgver.tgz
	gtk2.patch)
md5sums=('3ee8b01a7e089570f66d89dac353cc2c'
         '60fa92b11a575041c3a5d1a36c11f4e7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .orig -i ../gtk2.patch
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CPPFLAGS="$CPPFLAGS -I/usr/include/libpng12"
  export PNG_LIBS="-lpng12"
# export LDFLAGS="`echo $LDFLAGS|sed -e 's/,--as-needed//'`"
  ./configure \
    --with-image-library=imlib2 \
    --with-gtk-config="pkg-config x11 gtk+-2.0" \
    --with-imlib2-config="pkg-config imlib2" \
    --prefix=/usr \
    --mandir=/usr/share/man
  make LDADD='-lm'
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "chbg.desktop" "$pkgdir/usr/share/applications/chbg.desktop"
  install -Dm644 "chbg_64x64.xpm" "$pkgdir/usr/share/pixmaps/chbg_64x64.xpm"
}
