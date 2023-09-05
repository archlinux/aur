# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=polyorb
pkgdesc='Provides the Distributed Systems Annex (DSA) to build distributed applications with Ada.'
pkgver=20221130
pkgrel=2

arch=(i686 x86_64)
url=https://github.com/AdaCore/PolyORB
license=(GPL)

depends=(gcc-ada 
         xmlada
         gnatcoll-core
         openssl)
         
makedepends=(gprbuild
             autoconf
             automake
             python-sphinx
             python-sphinx_rtd_theme
             texlive-meta)

source=(https://github.com/AdaCore/PolyORB/archive/refs/heads/master.zip
        patch-Makefile.in)

sha256sums=(aac21a3ccdff7e048c78ee683432bfb2c24af6f37ccf6de490fb2d7cd5fa98a2
            c0703efe44949b5adb1be9fcb44110a132fbca81dda690a6623bc326df94328a)


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