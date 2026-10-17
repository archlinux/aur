# Maintainer:  Jose Riha <jose1711 gmail com>

pkgname=psani-profi
pkgver=3.4.01
pkgrel=3
pkgdesc="Program that will teach you touchtyping (czech)"
arch=('i686' 'x86_64')
url="http://www.sallyx.org/sally/psani-vsemi-deseti/"
license=('GPL')
depends=(bash luit)
source=("http://www.sallyx.org/sally/download.php?file=psani-vsemi-deseti%2F${pkgname}_${pkgver}.tar.gz" "psani")
md5sums=('104efc83c44987416386ae6607c96537'
         'b80e5471e04a4dac63cffeae0587b6eb')

build() {
  cd "$srcdir/${pkgname}_${pkgver}/zdrojaky"
  ./configure --with-zobraz-test --with-lat-dir=/usr/share --with-prg-dir=/usr/bin --with-man-dir=/usr/share/man
  # old K&R-ish code, needs to be accepted by GCC >= 14
  sed -i '/^CFLAGS=/s/$/ -fpermissive/' Makefile
  make
  ./configure --with-zobraz-test --with-lat-dir=$pkgdir/usr/share --with-prg-dir=$pkgdir/usr/bin --with-man-dir=$pkgdir/usr/share/man
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}/zdrojaky"
  #./configure --with-zobraz-test --with-lat-dir=$pkgdir/usr/share --with-prg-dir=$pkgdir/usr/bin --with-man-dir=$pkgdir/usr/share/man
  make DESTDIR=$pkgdir install
  # this is useless - we have pacman
  rm $pkgdir/usr/bin/${pkgname}-${pkgver}-uninstall.sh
  # program must not be started directly (it needs ISO-8859-2 locale + luit),
  # so hide the binary and expose only the wrapper
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  mv "$pkgdir/usr/bin/${pkgname}-${pkgver}" "$pkgdir/usr/lib/$pkgname/$pkgname"
  install -Dm755 "$srcdir/psani" "$pkgdir/usr/bin/psani"
  ln -s psani "$pkgdir/usr/bin/$pkgname"
  chown -R root:root $pkgdir/usr/share/psanipb
}
