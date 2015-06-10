# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: ezzetabi <ezzetabi@gawab.com>
pkgname=gfontview
pkgver=0.5.0
pkgrel=3
pkgdesc="An outline font viewer for Linux."
arch=(i686 x86_64)
url="http://gfontview.sourceforge.net/"
license=('GPL')
groups=()
depends=('giflib' 'gtk' 't1lib')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
changelog=ChangeLog
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
  "http://games.linux.sk/files/freetype-1.3.1.tar.gz"
)
noextract=()

build() {
  cd "$srcdir"/freetype-1.3.1/lib
  gcc -Os -c -Iarch/ansi -I. arch/ansi/freetype.c
  mv freetype.o "$srcdir/$pkgname-$pkgver"
  cp freetype.h "$srcdir/$pkgname-$pkgver"
  cp fterrid.h "$srcdir/$pkgname-$pkgver"
  cp ftnameid.h "$srcdir/$pkgname-$pkgver"
  cd extend
  gcc -Os -c -I../arch/ansi -I.. ftxerr18.c
  cp ftxerr18.h "$srcdir/$pkgname-$pkgver"
  gcc -Os -c -I../arch/ansi -I.. ftxkern.c
  cp ftxkern.h "$srcdir/$pkgname-$pkgver"
  gcc -Os -c -I../arch/ansi -I.. ftxpost.c
  cp ftxpost.h "$srcdir/$pkgname-$pkgver"
  mv *.o "$srcdir/$pkgname-$pkgver"

  cd "$srcdir/$pkgname-$pkgver"

  #ignore freetype v1 failure, we will inject it.
  sed -i configure -e '/TrueType/ d'

  #C++ does not allow using the enum keyword that way.
  sed -i gfont.C -e '1106 s_enum__'
  sed -i dialogs.C -e '1330 s_enum__'

  #gcc does not manage multi-line string literals since... long ago.
  sed -i ps.h -e 's_\\$__'
  sed -i ps.h -e '/const char/,/;$/ { /const char/b; /;$/b; s_^\|$_"_g }'
  sed -i ps.h -e '/^[^"]*"[^"]*$/ s_"__'

  #Oh come on... I cannot believe it never crashed on you...
  #the sed lines sound crazy, but I just have to swap line 336 and 337.
  sed -i dialogs.C -ne '
   334!{p;d;}
   h;n;:1
   335!{N;b1}
   G;h;n;p;g;p'
  sed -i dialogs.C -ne '
   334!{p;d;}
   h;n;:1
   336!{N;b1}
   G;h;n;p;g;p'
  CPPFLAGS= ./configure  --prefix=/usr --enable-gnome=no --disable-nls

  #We inject the old freetype
  sed -i Makefile -e '/^gfontview_OBJECTS *=/ s_$_ freetype.o ftxerr18.o ftxkern.o ftxpost.o_'

  make || return 1
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" applicationsdir='${datadir}/applications' install
  install -m755 -d "$pkgdir"/usr/share/ghostscript/fonts
}

md5sums=('f06e0e9d67f7d8b3af251fa593e83eeb'
         '9a9e7ad00c1ef6dfbf8f8e19ceefb300')

# vim:set ts=2 sw=2 et:
