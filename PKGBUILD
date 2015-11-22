# Maintainer: Bartek Jasicki <thindil@laeran.pl>
# Contributor: Julian Leyh <julian@vgai.de>

pkgname=ncurses-ada
pkgver=6.0
pkgrel=1
pkgdesc="Ada binding for ncurses library"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
depends=('ncurses' 'gcc-ada')
source=(ftp://ftp.gnu.org/pub/gnu/${pkgname%-ada}/${pkgname%-ada}-${pkgver}.tar.gz
        ncurses.gpr)
md5sums=('ee13d052e1ead260d7c28071f46eefb1'
         '7864c280e2023a9865463d515fcb5ae5')

build() {
  cd "$srcdir/${pkgname%-ada}-$pkgver/Ada95"
  cp ../man/MKada_config.in doc
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --with-shared --with-normal --without-debug \
    --enable-widec --with-ada-sharedlib \
    --with-ada-include=/usr/include/ncurses-ada \
    --with-ada-objects=/usr/lib/ncurses-ada
  sed --in-place '/ADAGEN_LDFLAGS/d' gen/Makefile
  make
}

package() {
  cd "$srcdir/${pkgname%-ada}-$pkgver/Ada95"
  make DESTDIR="$pkgdir/" install

  test -d "$pkgdir/usr/lib/gnat" || mkdir "$pkgdir/usr/lib/gnat"
  install -m 644 "$srcdir/ncurses.gpr" "$pkgdir/usr/lib/gnat/"
}

# vim:set ts=2 sw=2 et:
