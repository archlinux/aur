# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatdoc
pkgver=24.0w
pkgrel=1
pkgdesc='GNAT documentation generation tool.'

url=https://github.com/AdaCore/gnatdoc
arch=(i686 x86_64)
#license=(GPL3 custom)

depends=(gnatcoll-core markdown gpr-unit-provider)
makedepends=(gprbuild)

source=(file:///opt/gnatstudio-sources/"$pkgname"4-$pkgver-20230428-16616-src.tar.gz)
sha256sums=(2a627fd36a0b157aadbcfc3ff5a248b0e47680e519f874cc750b44bc8b7478dc)


build()
{
    cd $srcdir/"$pkgname"4-$pkgver-20230428-16616-src
 
   export LIBRARY_TYPE=relocatable
   
   gprbuild -j0 -p -P gnat/libgnatdoc.gpr \
             -XSUPERPROJECT=

#    export LIBRARY_TYPE=relocatable
    make all
}


package()
{
    cd $srcdir/"$pkgname"4-$pkgver-20230428-16616-src

    gprinstall gnat/gnatdoc.gpr                             \
               --prefix=$pkgdir/usr                         \
               --create-missing-dirs                        \
               -XGPR_UNIT_PROVIDER_LIBRARY_TYPE=relocatable \
               -XGPR2_LIBRARY_TYPE=relocatable

    gprinstall gnat/libgnatdoc.gpr    \
               --prefix=$pkgdir/usr   \
               --create-missing-dirs

    # Install the license.
    #
    install -D -m644   \
       COPYING3        \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3
}
