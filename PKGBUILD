# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=polyorb
pkgver=20210731
pkgrel=1
pkgdesc="Provides the Distributed Systems Annex (DSA) to build distributed applications with Ada."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/PolyORB"
license=('GPL')
depends=('gcc-ada' 'xmlada' 'gnatcoll-core' 'openssl')
makedepends=('gprbuild' 'autoconf' 'python-sphinx' 'texlive-core' 'texlive-latexextra')

source=(https://github.com/AdaCore/PolyORB/archive/master.zip
        patch-Makefile.in)

md5sums=('912703bd4dac69de723779e6bfad6ab5'
         '002a3fd9d6f9015a004f03dda36d7020')


prepare()
{
  cd $srcdir/PolyORB-master
  
  patch -p1 -i ../patch-Makefile.in

  support/reconfig

  # 'support/reconfig' does not generate the 'compile' and 'missing' files, so create them.
  #
  touch support/compile
  touch support/missing
}


build() 
{
  cd $srcdir/PolyORB-master

  CFLAGS="${CFLAGS//-Wformat}"
  CFLAGS="${CFLAGS//-Werror=format-security}"

  ./configure --prefix=/usr                                             \
              --enable-warnings=n                                       \
              --with-gprbuild=yes                                       \
              --with-gnatcoll=yes                                       \
              --with-appli-perso="corba dsa moma"                       \
              --with-proto-perso="giop soap"                            \
              --with-corba-services="event ir naming notification time" \
              --with-openssl

  make -j1
  make -j1 docs
}


package()
{
  cd $srcdir/PolyORB-master

  DESTDIR=$pkgdir make -j1 install all
}
