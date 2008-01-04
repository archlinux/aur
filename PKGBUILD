# Contributor: Stephen Caraher <moskvax@gmail.com>, Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

pkgname=gnuplot-cvs-pdflib
pkgver=20060827
pkgrel=2gtk28
pkgdesc="A command-line driven interactive function and data plotting utility with many output formats."
url="http://www.gnuplot.info/"
license=
arch=('i686')
depends=('gd' 'wxgtk' 'pdflib') 
makedepends=('sed' 'cvs' 'automake' 'autoconf' 'pdflib')
conflicts=('gnuplot')
provides=('gnuplot')
source=()
md5sums=()
arch=('i686')

_cvsmod="gnuplot"
_cvsroot=":pserver:anonymous:@gnuplot.cvs.sourceforge.net:/cvsroot/$_cvsmod"

build() {
  cd $startdir/src
  msg "Connecting to gnuplot.cvs.sourceforge.net..."
  cvs -z3 -d$_cvsroot co -D $pkgver -P $_cvsmod

  msg "CVS checkout done or server timeout"

  cd $_cvsmod
  msg "Running prepare script..."
  ./prepare
  mkdir ../$_cvsmod-build
  cd ../$_cvsmod-build
  msg "Running configure script..."
  ../$_cvsmod/configure --prefix=/usr --libexecdir=/usr/bin --with-gihdir=/usr/share/gnuplot --with-readline=gnu --with-pdf
  sed -i 's|^pkglibexecdir = $(libexecdir)/gnuplot/4.1|pkglibexecdir = /usr/bin|' src/Makefile
#  sed -i 's|^postscriptdir.*|postscriptdir = $(pkgdatadir)|' term/Makefile
  msg "Running make & make install..."
  make || return 1
  make prefix=$startdir/pkg/usr libexecdir=$startdir/pkg/usr/bin \
      pkglibexecdir=$startdir/pkg/usr/bin \
      GIHDIR=$startdir/pkg/usr/share/gnuplot \
		pkgdatadir=$startdir/pkg/usr/share/gnuplot \
      datadir=$startdir/pkg/usr/share/gnuplot install
  install -D ../$_cvsmod/Copyright $startdir/pkg/usr/share/licenses/custom/gnuplot/Copyright

  rm -r  $startdir/src/$_cvsmod-build
}
