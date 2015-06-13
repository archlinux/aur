# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Giovanni Scafora <linuxmania at gmail dot com>
# Contributor: Andrew Sheng <science4sail at gmail dot com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=open-invaders
pkgver=0.3
pkgrel=2
pkgdesc="A clone of Space Invaders"
arch=('i686' 'x86_64')
#url="http://www.jamyskis.net/invaders.php"
url="http://sourceforge.net/projects/open-invaders/"
license=('GPL2')
depends=('allegro4' 'gcc-libs')
makedepends=('dumb')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
#source=(http://www.jamyskis.net/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('35c0d8ec3beacfc97389d38eef3555b2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=668815
  sed -i 's/ALLEGRO_LINUX/ALLEGRO_UNIX/' {headers/declare.h,src/collision.cc,src/init.cc,src/ending.cc,src/input.cc,src/interrupt.cc,src/intro.cc}
  sed -i '24i #include <sys/stat.h>' src/init.cc
  # http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=638376
  if [[ "$CARCH" == "x86_64" ]]; then
      sed -i 's/#define MASK_WORD_BITBITS 5/#define MASK_WORD_BITBITS 6/' headers/pmask.h
  fi
  ./configure --docdir=/usr/share/doc --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Move docs to the proper location
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/"
}
