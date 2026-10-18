# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=byojeopardy
pkgver=1.2.14
pkgrel=4
pkgdesc="Build Your Own Jeopardy is a program to create and play Jeopardy-like games."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/byojeopardy/"
license=('GPL')
depends=('libxslt' 'gtk2')
source=(http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz?download
        gcc15-libxml2.patch)
md5sums=('a647a73c2787b247c80056be8e01f2ea'
         '8f75dd3266dbc19c05ebc3cc3001f41e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # two of the patched files have CRLF line endings, which a patch file kept in git loses
  sed -i 's/\r$//' xhtmlite/xhtmlite_module/{xhtmlcallbacks,xhtmlundo}.c
  # libxml2 2.14 made xmlCharEncodingHandler private; missing prototypes (pointer returns)
  patch -p1 -i "$srcdir/gcc15-libxml2.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # old C (gnu89 inline semantics, common symbols): GCC 14+ makes implicit declarations and pointer mismatches errors
  CFLAGS+=" -std=gnu89 -fcommon -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types -Wno-error=return-mismatch"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
