# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aectann <aectann@infoline.su>

pkgname=fbv
pkgver=1.0b
pkgrel=12
pkgdesc="FrameBuffer image viewer"
arch=('x86_64')
url="http://s-tech.elsat.net.pl/fbv/"
license=('GPL')
depends=('libpng' 'giflib' 'libjpeg')
source=("http://s-tech.elsat.net.pl/fbv/$pkgname-$pkgver.tar.gz"
        'giflib-5.1.patch')
md5sums=('3e466375b930ec22be44f1041e77b55d'
         'f91404fb82f0b6b9fc0e0716f0c182c0')
sha256sums=('9b55b9dafd5eb01562060d860e267e309a1876e8ba5ce4d3303484b94129ab3c'
            '17bd39934b390b22b27704e18f7b3fcb831bd3e230ffc9f50aa027d66e51a829')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|setjmp(png_ptr->jmpbuf)|setjmp(png_jmpbuf(png_ptr))|' png.c
  patch -Np1 -i ../giflib-5.1.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  sed -i 's|LIBS.*|LIBS=-lpng -ljpeg -lgif|' Make.conf
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  make DESTDIR="$pkgdir" install
}
