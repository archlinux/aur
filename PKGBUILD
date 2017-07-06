# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=adacurses
pkgver=20170415
pkgrel=2
pkgdesc="An Ada binding to the 'ncurses' C library."

arch=('i686' 'x86_64')
url="http://http://invisible-island.net/ncurses/ncurses-Ada95.html"
license=('MIT')

depends=('gcc-ada')

source=('ftp://invisible-island.net/AdaCurses/current/AdaCurses-20170415.tgz'
        'adacurses.gpr.in')

md5sums=('b629787a8b35a4576bcdc42202d10171'
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
