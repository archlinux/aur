# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>
# Maintainer:  Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=nco
pkgver=4.9.2
pkgrel=2
pkgdesc="netCDF Operators allow users to manipulate and analyse data stored in NetCDF files"
url="http://nco.sourceforge.net/"
license=("GPL")
depends=('netcdf' 'udunits' 'gsl')
makedepends=('antlr2')
arch=('i686' 'x86_64')
options=('!libtool')
source=(https://github.com/nco/nco/archive/$pkgver.tar.gz)
md5sums=('366a949084d404b0380af7426ed94648')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i configure -e 's/runantlr/runantlr2/g'
  sed -i src/nco/ncap_lex.l -e 's/yy_size_t yyget_leng/int yyget_leng/'
  ./configure --prefix=/usr \
      --enable-netcdf4 \
      --enable-gsl \
      --enable-ncoxx \
      --enable-udunits2 \
      --enable-optimize-custom
  make CXXFLAGS+="-fpermissive -fPIC" CFLAGS+="-fPIC -DACCEPT_USE_OF_DEPRECATED_PROJ_API_H"
  # make check || return 1
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install install-html
}
# vim:set ts=2 sw=2 et:
