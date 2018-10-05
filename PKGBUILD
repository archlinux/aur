# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=adacurses
pkgver=20180127
pkgrel=1
pkgdesc="An Ada binding to the 'ncurses' C library."

arch=('i686' 'x86_64')
url="http://http://invisible-island.net/ncurses/ncurses-Ada95.html"
license=('MIT')

makedepends=('gcc-ada')

source=('ftp://ftp.invisible-island.net/AdaCurses/AdaCurses.tar.gz'
        'adacurses.gpr.in')

md5sums=('d7653259eed56ed19b8acfa408b085d4'
         'bcf4fda38d94da5fb04325c51217d790')

PREFIX=/usr


prepare()
{
  cd "$srcdir/AdaCurses-$pkgver"

  sed -e '/(INSTALL_PROG)/d'      \
      -e 's/@ADAGEN_LDFLAGS@//'   \
      -i                          \
      gen/Makefile.in >> gen/Makefile.in
}


build() 
{
  cd "$srcdir/AdaCurses-$pkgver"

  ./configure --prefix=/usr                                  \
              --with-install-prefix="$pkgdir"                \
              --with-ada-include=${PREFIX}/include/adacurses \
              --with-ada-objects=${PREFIX}/lib/adacurses     \
              --libdir=${PREFIX}/lib/adacurses               \
              --enable-widec
  make -j1
}


package() 
{
  cd "$srcdir/AdaCurses-$pkgver"
  make install

  STAGEDIR=$pkgdir
  FILESDIR=$srcdir

  install gen/adacurses-config \
          ${STAGEDIR}${PREFIX}/bin/

  mkdir ${STAGEDIR}${PREFIX}/lib/gnat

  sed "s|@PREFIX@|${PREFIX}|g" ${FILESDIR}/adacurses.gpr.in > \
             ${STAGEDIR}${PREFIX}/lib/gnat/adacurses.gpr
}

