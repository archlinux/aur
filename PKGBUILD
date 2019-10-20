# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nted
pkgver=1.10.18
pkgrel=6
pkgdesc="A free music score editor for Linux."
arch=('i686' 'x86_64')
depends=('harfbuzz' 'gdk-pixbuf2' 'pango' 'gtk2' 'alsa-lib')
makedepends=('gcc6')
license=('GPL')
url="http://http.debian.net/debian/pool/main/n/nted/"
options=('!libtool' '!strip' '!makeflags')
source=("http://urchlay.naptime.net/~urchlay/src/nted-$pkgver.tar.gz"
	"http://http.debian.net/debian/pool/main/n/nted/nted_$pkgver-12.debian.tar.xz")
sha256sums=('808df3c851dbc4b24efdbf96c4e6ed28152deb301c4373268831f2a243e8f1ac'
            '715e5acfb986f0b5b9c898c1a22f06e1da4b58713616c8e525b668e2f16fd074')

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
  CXX=g++-6 CXXFLAGS=" -O2 -std=c++11 -Wno-narrowing" ./configure --prefix=/usr 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
