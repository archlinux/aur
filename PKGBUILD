# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=polyorb
pkgver=20200718
pkgrel=1
pkgdesc="Provides the Distributed Systems Annex (DSA) to build distributed applications with Ada."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/PolyORB"
license=('GPL')
depends=('gcc-ada')
makedepends=('gprbuild' 'autoconf')

source=(https://github.com/AdaCore/PolyORB/archive/master.zip
        patch-Makefile.in)

md5sums=('ab64b033af0d9cb7c1d83665f1bb69a9'
         '40476ea50c9ac1c2473d9801e765be04')

prepare()
{
  ## Force use of python2
  #
  cd $srcdir
  rm -fr temp_bin
  mkdir  temp_bin
  ln -s /usr/bin/python2        temp_bin/python
  ln -s /usr/bin/python2-config temp_bin/python-config

  cd $srcdir/PolyORB-master
  patch -p0 -i ../patch-Makefile.in

  sed -i 's/-gnatw_A//' projects/polyorb_src_dsa.gpr
  sed -i 's/-gnatw_A//' projects/polyorb_common.gpr
}


build() 
{
  cd $srcdir/PolyORB-master

  PATH=$srcdir/temp_bin:$PATH

  support/reconfig
  ./configure --prefix=/usr  --with-appli-perso="dsa"  --with-proto-perso="giop"  --enable-warnings=n
  make -j1 all
}


package()
{
  cd $srcdir/PolyORB-master

  PATH=$srcdir/temp_bin:$PATH

  DESTDIR=$pkgdir make install 
}
