# Contributor: Stephen Caraher <moskvax@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jon Gjengset <jon@tsp.io>

pkgname=gnuplot-cvs
pkgver=5.3r20170621
pkgrel=1
pkgdesc="Plotting package which outputs to X11, PostScript, PNG, GIF, and others -- cvs version"
arch=('i686' 'x86_64') 
url="http://www.gnuplot.info"
license=('custom')
depends=('gd' 'lua' 'qt5-svg' 'glib2' 'pango' 'cairo') 
makedepends=('cvs' 'emacs' 'texlive-core' 'texlive-latexextra' 'qt5-base' 'qt5-tools')
options=('!makeflags')
conflicts=('gnuplot')
provides=('gnuplot')
source=('docs.patch')
md5sums=('bae9bd4ee96f75b64760a97786735120')
_cvsmod="gnuplot"
_cvsroot=":pserver:anonymous:@gnuplot.cvs.sourceforge.net:/cvsroot/$_cvsmod"

pkgver() {
  cd $srcdir
  if [ -d $_cvsmod/CVS ]; then
    msg2 "Updating existing checkout"
    cd $_cvsmod
    cvs -qz3 update -CdP > /dev/null
  else
    msg2 "Checking out upstream code"
    cvs -qz3 -d$_cvsroot co -P $_cvsmod > /dev/null
    cd $_cvsmod
  fi
  msg2 "Checkout up to date"

  printf "%sr%s" "$(cat VERSION)" "$(head -1 ChangeLog |awk '{print $1}' |sed s+-++g)"
}

prepare() {
  if [ -d $_cvsmod/CVS ]; then
      cd "$srcdir/$_cvsmod"
      sed -i 's+-fPIE+-fPIC+' configure.ac
  fi
}

build() {
  cd $srcdir/$_cvsmod
  
  msg "Preparing source repository"
  ./prepare

  msg "Fix default source location for fonts"
  # fix default source location; use the GDFONTPATH variable to modify at runtime 
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' src/variable.c

  sed -i -e 's|/usr/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
         -e 's|$(X11ROOT)/X11R6/lib/X11/fonts/Type1|$(X11ROOT)/usr/share/fonts/Type1|' \
         src/variable.c

  TERMLIBS='-lX11' ./configure --prefix=/usr \
	 --libexecdir=/usr/bin \
	 --with-gihdir=/usr/share/gnuplot \
	 --with-readline=gnu \
	 --disable-wxwidgets \
	 --with-qt=qt5 

  LANG=C make pkglibexecdir=/usr/bin
  patch -Np1 < $srcdir/docs.patch
  cd docs
  LANG=C make info
}

package() {
  cd "$srcdir/$_cvsmod"

  msg "Installing core files"
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install

  install -Dm644 Copyright \
	  "$pkgdir/usr/share/licenses/$pkgname/Copyright"

  rm -f "$pkgdir/usr/share/texmf-dist/ls-R"
  install -Dm644 docs/gnuplot.info \
	  "$pkgdir/usr/share/info/gnuplot.info"
}
