# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatdoc
pkgdesc='GNAT documentation generation tool.'
pkgver=25.0w
pkgrel=1

url=https://github.com/AdaCore/gnatdoc
arch=(i686 x86_64)
#license=(GPL3 custom)

depends=(gnatcoll-core markdown gpr-unit-provider)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/"$pkgname"4-$pkgver-20240505-164DF-src.tar.gz)
sha256sums=(ea43e0d912549db2e39c3c897be5faa0c433a14b0875130804b5dd6c032ace8b)


build()
{
    cd $srcdir/"$pkgname"4-$pkgver-20240505-164DF-src
 
    export LIBRARY_TYPE=relocatable
 
    gprbuild -j0 -p -P gnat/libgnatdoc.gpr
    gprbuild -j0 -p -P gnat/gnatdoc.gpr
   
    make build-documentation    \
        1> make_docs-1.log      \
        2> make_docs-2.log
}


package()
{
    cd $srcdir/"$pkgname"4-$pkgver-20240505-164DF-src

    gprinstall gnat/gnatdoc.gpr                             \
               --prefix=$pkgdir/usr                         \
               --create-missing-dirs                        \
               -XGPR_UNIT_PROVIDER_LIBRARY_TYPE=relocatable \
               -XGPR2_LIBRARY_TYPE=relocatable

    gprinstall gnat/libgnatdoc.gpr    \
               --prefix=$pkgdir/usr   \
               --create-missing-dirs

    PREFIX=$pkgdir/usr         \
    make install-documentation \
    1> install-docs-1.log      \
    2> install_docs-2.log

    # Get rid of wierd double share folder
    #
    rm -fr $pkgdir/usr/share/share

#    cp -r share/gnatdoc $pkgdir/usr/share
    
    # Install the license.
    #
    install -D -m644   \
       COPYING3        \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3
}
