# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=adacurses-dev
pkgver=20170708
pkgrel=1
pkgdesc="Development version of an Ada binding to the 'ncurses' C library."

arch=('i686' 'x86_64')
url="http://http://invisible-island.net/ncurses/ncurses-Ada95.html"
license=('MIT')

depends=('gcc-ada')
conflicts=('adacurses')

source=('ftp://invisible-island.net/AdaCurses/current/AdaCurses-20170708.tgz'
        'adacurses.gpr.in')

md5sums=('389cfaf9806d2ff96f5068678d730807'
         'bcf4fda38d94da5fb04325c51217d790')

PREFIX=/usr


build() 
{
  cd "$srcdir/AdaCurses-$pkgver"

  ./configure --prefix=/usr                                  \
              --with-install-prefix="$pkgdir"                \
              --with-ada-include=${PREFIX}/include/adacurses \
              --with-ada-objects=${PREFIX}/lib/adacurses     \
              --libdir=${PREFIX}/lib/adacurses               \
              --enable-widec
  make
}


package() 
{
  cd "$srcdir/AdaCurses-$pkgver"
  make install

  STAGEDIR=$pkgdir
  FILESDIR=$srcdir

  # The DESTDIR line in gen/adacurses-config is not used and it contains a reference
  # to the makepkg generated pkg directory, so delete that line.
  #
  sed -e '/DESTDIR/d'      \
      -i                   \
      gen/adacurses-config

  install gen/adacurses-config \
          ${STAGEDIR}${PREFIX}/bin/

  mkdir ${STAGEDIR}${PREFIX}/lib/gnat

  sed "s|@PREFIX@|${PREFIX}|g" ${FILESDIR}/adacurses.gpr.in > \
             ${STAGEDIR}${PREFIX}/lib/gnat/adacurses.gpr
}
