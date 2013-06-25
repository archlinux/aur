# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: dave pretty <david (dot) pretty (at) gmail (dot) com >

pkgname=ghmm
pkgver=0.9_rc2
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="General Hidden Markov Model library"
arch=('i686' 'x86_64')
url="http://ghmm.org"
license=('LGPL')
depends=('gsl' 'libxml2')
makedepends=('automake' 'autoconf' 'm4' 'swig')
optdepends=('python2' 'python2-pygsl')
conflicts=('ghmm-svn')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname%20${_pkgver}/$pkgname-${_pkgver}.tar.gz")
md5sums=('9be708ffcb17eb23f4cdb3971c11f471')
sha256sums=('6a6a90b47f9a363d3f6e3283e34a986237dbde1196ab9f39dbb7dc2cf3eff057')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"
  mv configure.in configure.ac
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  ./autogen.sh
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make prefix="$pkgdir/usr" install # does not support DESTDIR

  # Name clash with graphviz also installing a `cluster` binary.
  # ghmm has fewer users than graphviz and is obsolete according to
  # docs, so I currently prefer renaming the ghmm-provided `cluster`.
  mv "$pkgdir/usr/bin/cluster" "$pkgdir/usr/bin/ghmm-cluster"
}
