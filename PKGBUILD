# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nted
pkgver=1.10.18
pkgrel=5
pkgdesc="A free music score editor for Linux."
arch=('i686' 'x86_64')
depends=('harfbuzz' 'gdk-pixbuf2' 'pango' 'gtk2' 'alsa-lib')
makedepends=('gcc49')
license=('GPL')
url="http://http.debian.net/debian/pool/main/n/nted/"
options=('!libtool' '!strip' '!makeflags')
source=("http://urchlay.naptime.net/~urchlay/src/nted-$pkgver.tar.gz"
	"http://http.debian.net/debian/pool/main/n/nted/nted_$pkgver-12.debian.tar.xz")
md5sums=('0ca7aa23109171ab643a9b552487bd4b'
         'ca741156f6633603c84fe3e8e74d0555')

prepare() {
  cd $pkgname-$pkgver
  
  for i in `head -10 $srcdir/debian/patches/series`
  do
    patch -p1 < "$srcdir"/debian/patches/$i || true
  done
  mv configure.in configure.ac
}

build() {
  cd $pkgname-$pkgver
  aclocal
  automake --add-missing
  autoreconf
  CXX=g++-4.9 CXXFLAGS=" -O2 -std=c++11 -Wno-narrowing" ./configure --prefix=/usr 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
