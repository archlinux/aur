# Contributor: Rod Kay     <charlie5 on #ada at irc.libera.chat>

pkgname=adacurses
pkgver=20220205
pkgrel=1
pkgdesc="An Ada binding to the 'ncurses' C library."

arch=('i686' 'x86_64')
url="https://invisible-island.net/ncurses/ncurses-Ada95.html"
license=('MIT')

makedepends=('gcc-ada')

source=('https://invisible-mirror.net/archives/AdaCurses/current/AdaCurses-20220205.tgz'
        'adacurses.gpr.in')

md5sums=('20bb4bcdf2cfd0ca91c1e12acca6b5ad'
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

  ./configure --prefix=${PREFIX}                             \
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

  export DESTDIR=$pkgdir
  make install

  mkdir -p "${pkgdir}${PREFIX}/share/gpr"

  sed "s|@PREFIX@|${PREFIX}|g"   \
      "$srcdir/adacurses.gpr.in" \
    > "${pkgdir}${PREFIX}/share/gpr/adacurses.gpr"

  # Install the license.
  install -D -m644     \
     "COPYING"        \
     "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}