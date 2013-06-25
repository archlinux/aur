# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: dave pretty <david (dot) pretty (at) gmail (dot) com >

pkgname=ghmm-svn
pkgver=2293
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
source=("$pkgname::svn+https://ghmm.svn.sourceforge.net/svnroot/ghmm/trunk/ghmm")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  svnversion | tr -d [A-z]
}

prepare() {
  cd "$srcdir/$pkgname"
  mv configure.in configure.ac
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make prefix="$pkgdir/usr" install # does not support DESTDIR

  # Name clash with graphviz also installing a `cluster` binary.
  # ghmm has fewer users than graphviz and is obsolete according to
  # docs, so I currently prefer renaming the ghmm-provided `cluster`.
  mv "$pkgdir/usr/bin/cluster" "$pkgdir/usr/bin/ghmm-cluster"
}
