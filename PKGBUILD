# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: dave pretty <david (dot) pretty (at) gmail (dot) com >

pkgname=ghmm-svn
pkgver=2290
pkgrel=2
pkgdesc="General Hidden Markov Model library"
arch=('i686' 'x86_64')
url="http://ghmm.org"
license=('LGPL')
depends=('gsl' 'libxml2')
makedepends=('automake' 'autoconf' 'm4' 'swig')
optdepends=('python2')
conflicts=('ghmm')
provides=('ghmm')

_svntrunk=https://ghmm.svn.sourceforge.net/svnroot/ghmm/trunk/ghmm
_svnmod=ghmm

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cd "$_svnmod"
  ./autogen.sh
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
  
}

package() {
  cd "$srcdir/$_svnmod"
  make prefix="$pkgdir/usr" install # does not support DESTDIR
}
