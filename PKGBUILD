# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=polyorb
pkgdesc='Provides the Distributed Systems Annex (DSA) to build distributed applications with Ada.'

epoch=1
pkgver=25.2
pkgrel=1

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

source=(#git+https://github.com/AdaCore/PolyORB.git#branch=$pkgver
        git+https://github.com/AdaCore/PolyORB.git
        patch-Makefile.in)

sha256sums=(SKIP
            c0703efe44949b5adb1be9fcb44110a132fbca81dda690a6623bc326df94328a)


prepare()
{
  cd $srcdir/PolyORB
  
  patch -p1 -i ../patch-Makefile.in

  support/reconfig

  # 'support/reconfig' does not generate the 'compile' and 'missing' files, so create them.
  #
  touch support/compile
  touch support/missing
}


build() 
{
  cd $srcdir/PolyORB

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
#              --enable-debug=yes \
#              --enable-assertion-policy=Check

  make -j1
  
  make -j1 docs                    \
        1> build_docs-warnings.log \
        2> build_docs-errors.log
}


package()
{
  cd $srcdir/PolyORB

  DESTDIR=$pkgdir make -j1 install all
}