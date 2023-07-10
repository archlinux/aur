# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nted
pkgver=1.10.18
pkgrel=7
pkgdesc="A free music score editor for Linux."
arch=('i686' 'x86_64')
depends=('harfbuzz' 'gdk-pixbuf2' 'pango' 'gtk2' 'alsa-lib')
makedepends=()
license=('GPL')
url="http://http.debian.net/debian/pool/main/n/nted/"
options=('!libtool' '!strip' '!makeflags')
source=("http://deb.debian.org/debian/pool/main/n/$pkgname/${pkgname}_$pkgver.orig.tar.gz"
	"http://http.debian.net/debian/pool/main/n/$pkgname/${pkgname}_$pkgver-13.debian.tar.xz")
sha256sums=('808df3c851dbc4b24efdbf96c4e6ed28152deb301c4373268831f2a243e8f1ac'
            'c9e6bc6e213641cd4f08964b36e2192c2ec6710d473088e2d1d4fc9e8e34108f')

prepare() {
  cd $pkgname-$pkgver
  
  for i in `cat "$srcdir"/debian/patches/series`
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
  CXXFLAGS=" -O2 -std=c++11 -Wno-narrowing" ./configure --prefix=/usr 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
