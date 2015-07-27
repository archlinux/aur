# Maintainer: Julien Morin <morin.jul@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pgplot
pkgver=5.2.2
pkgrel=6
pkgdesc="Fortran- or C-callable, device-independent graphics package for making simple scientific graphs."
url="http://www.astro.caltech.edu/~tjp/pgplot/"
license=('custom')
options=(!makeflags)
arch=('i686' 'x86_64')
makedepends=('gcc-fortran')
depends=('libpng' 'libx11')
source=(ftp://ftp.astro.caltech.edu/pub/pgplot/${pkgname}522.tar.gz pndriv.c.patch)
md5sums=('e8a6e8d0d5ef9d1709dfb567724525ae' '25535f059b2e39ea44f93c24a41abacd')

build() {
  cd $srcdir/$pkgname
  sed -i 's/! CGDRIV/CGDRIV/' drivers.list
  sed -i 's/! LXDRIV/LXDRIV/' drivers.list
  #sed -i 's/! PNDRIV/PNDRIV/' drivers.list
  sed -i 's/! PSDRIV/PSDRIV/' drivers.list
  sed -i 's/! TTDRIV 5/TTDRIV 5/' drivers.list
  sed -i 's/! XWDRIV/XWDRIV/1' drivers.list
  patch -p0 -i "${srcdir}"/pndriv.c.patch

  ./makemake . linux g77_gcc
  sed -i 's=pndriv.o : ./png.h ./pngconf.h ./zlib.h ./zconf.h=#pndriv.o : ./png.h ./pngconf.h ./zlib.h ./zconf.h=' makefile
  make FCOMPL=gfortran SHARED_LIB_LIBS="-lpng -lz" all cpg || return 1

  install -D -m644 libpgplot.a $pkgdir/usr/lib/libpgplot.a
  install -D -m755 libpgplot.so $pkgdir/usr/lib/libpgplot.so
  install -D -m644 grfont.dat  $pkgdir/usr/lib/grfont.dat
  install -D -m644 rgb.txt $pkgdir/usr/lib/rgb.txt
  install -D -m755 pgxwin_server $pkgdir/usr/bin/pgxwin_server
  install -D -m644 libcpgplot.a $pkgdir/usr/lib/libcpgplot.a
  install -D -m644 cpgplot.h $pkgdir/usr/include/cpgplot.h
  install -D -m644 copyright.notice $pkgdir/usr/share/licenses/custom/$pkgname/copyright.notice
}
