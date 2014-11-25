# Contributor: Stephen Caraher <moskvax@gmail.com>
# Maintainer: Olivier Mehani <shtrom-arch@ssji.net>

pkgname=gnuplot-cvs-pdflib
pkgver=20100805
pkgrel=1
pkgdesc="A command-line driven interactive function and data plotting utility with many output formats (incl. PDF)."
url="http://www.gnuplot.info/"
license=(custom:gnuplot)
arch=(i686 x86_64)
depends=('readline' 'gd' 'pdflib')
optdepends=('wxgtk: for wxterminal' 'lua: for tikz output') 
makedepends=('cvs')
conflicts=('gnuplot' 'gnuplot-mode')
provides=('gnuplot=4.5' 'gnuplot-mode')
source=()
md5sums=()
install=($pkgname.install)

_cvsmod="gnuplot"
_cvsroot=":pserver:anonymous:@gnuplot.cvs.sourceforge.net:/cvsroot/$_cvsmod"

build() {
  cd $srcdir
  msg "Connecting to gnuplot.cvs.sourceforge.net..."
  if [ -d $_cvsmod/CVS ]; then
	  echo "fetching only new files"
	  cd $_cvsmod
	  cvs -z3 update -d
  else
	  echo "fetching whole branch"
	  cvs -z3 -d$_cvsroot co -D $pkgver -P $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  [ -d $srcdir/$_cvsmod-build ] && rm -r  $srcdir/$_cvsmod-build
  cp -r $srcdir/$_cvsmod $srcdir/$_cvsmod-build

  cd $srcdir/$_cvsmod-build
  msg "Running prepare script..."
  ./prepare || return 1
  # fix default source location; use the GDFONTPATH variable 
  # to modify at runtime 
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' \
	  src/variable.c
  sed -i 's|/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
	  src/variable.c

  msg "Running configure script..."
  ./configure --prefix=/usr --libexecdir=/usr/lib \
	  --with-gihdir=/usr/share/gnuplot --with-readline=gnu \
	  --with-kpsexpand --enable-thin-spline --with-lua \
	  --with-pdf || return 2
#  sed -i 's|^pkglibexecdir = $(libexecdir)/gnuplot/4.1|pkglibexecdir = /usr/bin|' src/Makefile
#  sed -i 's|^postscriptdir.*|postscriptdir = $(pkgdatadir)|' term/Makefile

  msg "Running make & make install..."
  make || return 3
#  make prefix=$pkgdir/usr libexecdir=$pkgdir/usr/bin \
#	  pkglibexecdir=$pkgdir/usr/bin \
#	  GIHDIR=$pkgdir/usr/share/gnuplot \
#	  pkgdatadir=$pkgdir/usr/share/gnuplot \
#	  datadir=$pkgdir/usr/share/gnuplot install
  make DESTDIR=$pkgdir X11_DRIVER_DIR=$pkgdir/usr/bin install || return 1
  install -D ../$_cvsmod/Copyright \
    $pkgdir/usr/share/licenses/custom/gnuplot/Copyright
  gzip -9f $pkgdir/usr/share/info/gnuplot.info


  rm -r  $srcdir/$_cvsmod-build
}
