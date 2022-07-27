# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=polyorb
pkgver=20220727
pkgrel=1
pkgdesc="Provides the Distributed Systems Annex (DSA) to build distributed applications with Ada."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/PolyORB"
license=('GPL')
depends=('gcc-ada' 'xmlada' 'gnatcoll-core' 'openssl')
makedepends=('gprbuild' 'autoconf' 'python-sphinx' 'texlive-core' 'texlive-latexextra')

source=(https://github.com/AdaCore/PolyORB/archive/refs/heads/master.zip
        patch-Makefile.in)

sha256sums=('ababafe32624c0ece5dfa2ff710e6d90ceb97e4fc918af5113c47e8c6f07dd17'
            'c0703efe44949b5adb1be9fcb44110a132fbca81dda690a6623bc326df94328a')


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
