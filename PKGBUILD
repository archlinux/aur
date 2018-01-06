# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aectann <aectann@infoline.su>

pkgname=fbv
pkgver=1.0b
pkgrel=9
pkgdesc="FrameBuffer image viewer"
arch=('x86_64')
url="http://s-tech.elsat.net.pl/fbv/"
license=('GPL')
depends=('libpng' 'giflib' 'libjpeg')
source=(http://s-tech.elsat.net.pl/fbv/$pkgname-$pkgver.tar.gz
        giflib-5.1.patch)
md5sums=('3e466375b930ec22be44f1041e77b55d'
         'f91404fb82f0b6b9fc0e0716f0c182c0')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  sed -i 's|LIBS.*|LIBS=-lpng -ljpeg -lgif|' Make.conf
  sed -i 's|setjmp(png_ptr->jmpbuf)|setjmp(png_jmpbuf(png_ptr))|' png.c
  patch -Np1 -i ../giflib-5.1.patch
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/man/man1
  make DESTDIR="$pkgdir" install
}
