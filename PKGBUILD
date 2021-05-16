# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=polyorb
pkgver=20210516
pkgrel=1
pkgdesc="Provides the Distributed Systems Annex (DSA) to build distributed applications with Ada."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/PolyORB"
license=('GPL')
depends=('gcc-ada' 'xmlada' 'openssl')
makedepends=('gprbuild' 'autoconf' 'python-sphinx')

source=(https://github.com/AdaCore/PolyORB/archive/master.zip
        patch-Makefile.in)

md5sums=('77b0b1332f8dde9b76f615c7a4cb0401'
         '40476ea50c9ac1c2473d9801e765be04')


prepare()
{
  cd $srcdir/PolyORB-master
  patch -p0 -i ../patch-Makefile.in

  touch support/compile
  touch support/missing
}


build() 
{
  cd $srcdir/PolyORB-master

  support/reconfig
  ./configure --prefix=/usr                                             \
              --enable-warnings=n                                       \
              --with-gprbuild=yes                                       \
              --with-gnatcoll=yes                                       \
              --with-appli-perso="corba dsa moma"                       \
              --with-proto-perso="giop soap"                            \
              --with-corba-services="event ir naming notification time" \
              --with-openssl
  make -j1 all
  make -j1 examples
  make -j1 docs
}


package()
{
  cd $srcdir/PolyORB-master

  DESTDIR=$pkgdir make -j1 install all
}
