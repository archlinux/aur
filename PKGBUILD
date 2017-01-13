# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>
# Maintainer:  Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=nco
pkgver=4.6.3
pkgrel=1
pkgdesc="netCDF Operators allow users to manipulate and analyse data stored in NetCDF files"
url="http://nco.sourceforge.net/"
license=("GPL")
depends=('netcdf' 'udunits' 'gsl')
makedepends=('antlr2')
arch=('i686' 'x86_64')
options=('!libtool')
source=(https://github.com/nco/nco/archive/$pkgver.tar.gz)
md5sums=('0e1d6616c65ed3a30c54cc776da4f987')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i configure -e 's/runantlr/runantlr2/g'
  sed -i src/nco/ncap_lex.l -e 's/yy_size_t yyget_leng/int yyget_leng/'
  ./configure --prefix=/usr \
      --enable-netcdf-4 \
      --enable-gsl \
      --enable-ncoxx \
      --enable-udunits2 \
      --enable-optimize-custom || return 1
  make || return 1
  # make check || return 1
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install install-html || return 1
}
# vim:set ts=2 sw=2 et:
