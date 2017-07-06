# Contributor: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=polyorb
pkgver=252702
pkgrel=2
pkgdesc="PolyOrb provides the Distributed Systems Annex (DSA) to build distributed applications with Ada."

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/polyorb"
license=('GPL')
depends=("gcc-ada")
makedepends=("nawk" "subversion")

source=(svn+http://svn.eu.adacore.com/anonsvn/Dev/trunk/polyorb#revision=$pkgver
        patch-Makefile.in)

md5sums=('SKIP'
         '40476ea50c9ac1c2473d9801e765be04')

prepare()
{
  ## Force use of pyhon2
  #
  cd $srcdir
  rm -fr temp_bin
  mkdir  temp_bin
  ln -s /usr/bin/python2        temp_bin/python
  ln -s /usr/bin/python2-config temp_bin/python-config

  cd $srcdir/$pkgname
  patch -p0 -i ../patch-Makefile.in
}


build() 
{
  cd $srcdir/$pkgname

  PATH=$srcdir/temp_bin:$PATH

  PYTHON=python2   support/reconfig
  PYTHON=python2   ./configure --prefix=/usr  --with-appli-perso="dsa"  --with-proto-perso="giop"
  make -j1
}


package()
{
  cd $srcdir/$pkgname

  PATH=$srcdir/temp_bin:$PATH

  PYTHON=python2 DESTDIR=$pkgdir make install 
}
