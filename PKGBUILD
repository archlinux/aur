# Maintainer: LaraCraft304 <lara@craft.net.br>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=fltk11
pkgver=1.1.10
pkgrel=3
pkgdesc="Graphical user interface toolkit for X. Legacy 1.1.xx version."
arch=(i686 x86_64)
url="http://www.fltk.org/"
license=('GPL')
depends=('bash' 'zlib' 'libjpeg' 'libxft' 'libxext')
makedepends=('mesa')
provides=("${pkgname%11}=$pkgver")
source=("http://fltk.org/pub/fltk/$pkgver/fltk-$pkgver-source.tar.bz2")
md5sums=('a1765594bc427ff892e36089fe1fa672')

build() {
  cd "$srcdir/${pkgname%11}-$pkgver"

  LDFLAGS="${LDFLAGS//,--as-needed}" LIBS="-lfontconfig" \
  ./configure --prefix=/usr \
              --libdir=/usr/lib/${pkgname%11}-${pkgver%.10} \
              --includedir=/usr/include/${pkgname%11}-${pkgver%.10} \
              --enable-threads \
              --enable-xft \
              --enable-shared \
              --enable-xdbe \
              --enable-localpng
              
  make
}

package() {
  cd "$srcdir/${pkgname%11}-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove unneeded stuff
  rm -rf "$pkgdir/usr/share"

  # rename apps
  cd "$pkgdir/usr/bin"
  mv ${pkgname%11}-config ${pkgname%11}-${pkgver%.10}-config
  mv fluid fluid-${pkgver%.10}

  # static libs permission fix
  chmod 644 "$pkgdir/usr/lib/${pkgname%11}-${pkgver%.10}/"*.a
}
