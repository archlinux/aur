# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatdoc
pkgdesc='GNAT documentation generation tool.'
pkgver=26.0w
pkgrel=1

url=https://github.com/AdaCore/gnatdoc
arch=(i686 x86_64)
#license=(GPL3 custom)

depends=(gnatcoll-core markdown)
#depends=(gnatcoll-core markdown gpr-unit-provider)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/gnatdoc4-26.0w-20250416-1629F-src.tar.gz)
sha256sums=(7bb7ad55a9c7a91e2ca896532780f9cef610275f446fa33a385d923a8ebb6550)


build()
{
    cd $srcdir/gnatdoc4-26.0w-20250416-1629F-src
 
    export LIBRARY_TYPE=relocatable
 
    gprbuild -j0 -p -P gnat/libgnatdoc.gpr
    gprbuild -j0 -p -P gnat/gnatdoc.gpr
   
    make build-documentation    \
        1> make_docs-1.log      \
        2> make_docs-2.log
}


package()
{
    cd $srcdir/gnatdoc4-26.0w-20250416-1629F-src

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

    # Get rid of weird double share folder.
    #
    rm -fr $pkgdir/usr/share/share

#    cp -r share/gnatdoc $pkgdir/usr/share
    
    # Install the license.
    #
    install -D -m644   \
       LICENSE         \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
