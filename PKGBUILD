# Contributor: Rod Kay     <charlie5 on #ada at irc.libera.chat>

pkgname=adacurses
pkgver=20260103
pkgrel=1
pkgdesc="An Ada binding to the 'ncurses' C library."

arch=(i686 x86_64)
url=https://invisible-island.net/ncurses/ncurses-Ada95.html
license=(MIT)

makedepends=(gcc-ada)

source=(https://invisible-mirror.net/archives/AdaCurses/current/AdaCurses-$pkgver.tgz
        adacurses.gpr.in)

sha256sums=(c07f71371a799e2e821dd9d16f97296fdaef1199a98ec90524c3768f28b3c1b8
            3d722aac3df43e5baad8ee1054de86a4d3c41b234efdff97ae2bac0ee22e3b4a)

PREFIX=/usr


prepare()
{
  cd $srcdir/AdaCurses-$pkgver

  sed -e '/(INSTALL_PROG)/d'      \
      -e 's/@ADAGEN_LDFLAGS@//'   \
      -i                          \
      gen/Makefile.in >> gen/Makefile.in
}


build() 
{
  cd $srcdir/AdaCurses-$pkgver

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
  cd $srcdir/AdaCurses-$pkgver

  export DESTDIR=$pkgdir
  make install

  mkdir -p "${pkgdir}${PREFIX}/share/gpr"

  sed "s|@PREFIX@|${PREFIX}|g"   \
      "$srcdir/adacurses.gpr.in" \
    > "${pkgdir}${PREFIX}/share/gpr/adacurses.gpr"


  make -C doc install.html


  # Install the license.
  #
  install -D -m644     \
     "COPYING"        \
     "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}