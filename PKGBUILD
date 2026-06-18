# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=polyorb
pkgdesc='Provides the Distributed Systems Annex (DSA) to build distributed applications with Ada.'

epoch=1
pkgver=26.2
pkgrel=1

arch=(x86_64 aarch64)
url='https://github.com/AdaCore/PolyORB'
license=(GPL-3.0 custom)

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

#source=(git+https://github.com/AdaCore/PolyORB.git#branch=$pkgver
source=(git+https://github.com/charlie5/PolyORB.git
#        patch-Makefile.in
        json-build.sh-update_to_gnat22-patch
        Makefile.in-update_to_gnat22-patch
        polyorb_common.gpr-update_to_gnat22-patch)

sha256sums=(SKIP
#            c0703efe44949b5adb1be9fcb44110a132fbca81dda690a6623bc326df94328a
            705eb90b1ca895b1cae5a8e589c1da367e7bd6e0178d4c284908fe6291f630d8
            f80fa5fd04a56c4d20c5768fc8cbdcc3b57734c32d059db00c999b51265db338
            9653e61e564eb00de9dcc372fd68f6bc14822ea28056556ced9cc3e0c2a08787)


prepare()
{
   cd $srcdir/PolyORB

 #  patch -p1 -i $srcdir/patch-Makefile.in
   patch -p0 -i $srcdir/json-build.sh-update_to_gnat22-patch
   patch -p0 -i $srcdir/Makefile.in-update_to_gnat22-patch
   patch -p0 -i $srcdir/polyorb_common.gpr-update_to_gnat22-patch

   support/reconfig

   # 'support/reconfig' does not generate the 'compile' and 'missing' files, so create them.
   #
   touch support/compile support/missing
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

   make -j1 docs                   \
        1> build_docs-warnings.log \
        2> build_docs-errors.log
}


package()
{
   cd $srcdir/PolyORB

   make -j1 DESTDIR=$pkgdir install

   # Install the license.
   #
   install -D -m644 \
      COPYING3      \
      $pkgdir/usr/share/licenses/$pkgname/COPYING3

   # Install the custom license.
   #
   install -D -m644   \
      COPYING.RUNTIME \
      $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}
