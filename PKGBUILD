# Maintainer: Rod Kay  <charlie5 on #ada at irc.libera.chat>

pkgname=adacurses
pkgver=20260523
pkgrel=1
epoch=1
pkgdesc='An Ada binding to the ncurses C library.'

arch=(x86_64 aarch64)
url='https://invisible-island.net/ncurses/ncurses-Ada95.html'
license=(MIT)

makedepends=(gcc-ada)

source=(https://invisible-mirror.net/archives/AdaCurses/current/AdaCurses-$pkgver.tgz
        adacurses.gpr.in)

sha256sums=(8e8da3c9f39175c84ca0be963be8d9704fc5d877634c45efa27ff1a97df16984
            3d722aac3df43e5baad8ee1054de86a4d3c41b234efdff97ae2bac0ee22e3b4a)

_prefix=/usr


prepare()
{
   cd $srcdir/AdaCurses-$pkgver

   sed -e '/(INSTALL_PROG)/d'    \
       -e 's/@ADAGEN_LDFLAGS@//' \
       -i gen/Makefile.in
}


build()
{
   cd $srcdir/AdaCurses-$pkgver

   ./configure --prefix=$_prefix                                 \
               --with-install-prefix=$pkgdir                     \
               --with-ada-include=$_prefix/include/adacurses     \
               --with-ada-objects=$_prefix/lib/adacurses         \
               --libdir=$_prefix/lib/adacurses                   \
               --enable-widec

   make -j1
}


package()
{
   cd $srcdir/AdaCurses-$pkgver

   DESTDIR=$pkgdir make install

   mkdir -p $pkgdir$_prefix/share/gpr

   sed "s|@PREFIX@|$_prefix|g"  \
      $srcdir/adacurses.gpr.in  \
      > $pkgdir$_prefix/share/gpr/adacurses.gpr

   make -C doc install.html

   # Install the license.
   #
   install -D -m644 \
      COPYING       \
      $pkgdir/usr/share/licenses/$pkgname/COPYING
}
