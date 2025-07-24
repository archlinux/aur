# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgbase=gpr
pkgdesc='Parser for Ada GPR project files.'
pkgname=(gpr gpr2tools)
pkgver=26.0w
pkgrel=1

url=https://github.com/AdaCore/gpr
arch=(i686 x86_64)
license=(GPL3 Apache)

depends=(gnatcoll-iconv
         gnatcoll-gmp
         langkit
         python
         which
         python-funcy
         python-mako
         python-docutils)

makedepends=(gprbuild python-e3-core)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/gpr2-26.0w-20250409-1629D-src.tar.gz)
sha256sums=(f1312f74ae8e3f7093bd0ca955da2c4d075ae2d4546ed1339e10c8b75d8cd86d)

 
export ENABLE_SHARED=yes
 
 
 
prepare()
{
    cd $srcdir/gpr2-26.0w-20250416-161FC-src

    sed -i 's/libexec/lib/g' tools/projects/gpr2tools.gpr

    make setup prefix=$pkgdir/usr GPR2KBDIR=/usr/share/gprconfig
}


build()
{
    cd $srcdir/gpr2-26.0w-20250416-161FC-src

    make all

    # Generate documentation.
    #
    make -C doc                     \
         html pdf                   \
         1> build-docs-warnings.log \
         2> build-docs-errors.log 
         
    make -C doc/gpr2_user_manual           \
         all                               \
         1> build-user_manual-warnings.log \
         2> build-user_manual-errors.log 
}


package_gpr()
{
    cd $srcdir/gpr2-26.0w-20250416-161FC-src

    make -j1 install-libs
    
    cp $pkgdir/usr/include/gpr2.static/* \
       $pkgdir/usr/include/gpr2.relocatable
    
#    cp $pkgdir/usr/include/gpr2.static/gpr2-build-view_tables.ads \
#       $pkgdir/usr/include/gpr2.relocatable
    
#    cp $pkgdir/usr/include/gpr2.static/gpr2-build-view_tables.adb \
#       $pkgdir/usr/include/gpr2.relocatable
    
#    cp $pkgdir/usr/include/gpr2.static/gpr2-build-view_tables-update_sources_list.adb \
#       $pkgdir/usr/include/gpr2.relocatable
    

    # Install the documentation.
    #
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    
    cp -r doc/gpr2_user_manual/build/html                            $pkgdir/usr/share/doc/$pkgname
    cp    doc/gpr2_user_manual/build/latex/gpr2libraryusermanual.pdf $pkgdir/usr/share/doc/$pkgname


    # Install the license.
    #
    install -D -m644 \
       LICENSE-lib   \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE-lib
}


package_gpr2tools()
{
    cd $srcdir/gpr2-26.0w-20250416-161FC-src

    make -j1 prefix=$pkgdir/usr install-tools
    
    rm -fr $pkgdir/usr/share/examples/gprbuild     # Conflict with 'gprbuild'.
    
    mv $pkgdir/usr/bin/gprconfig \
       $pkgdir/usr/bin/gpr2config                  # Conflict with 'gprbuild'.


    # Install the documentation.
    #
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    
    cp -r doc/html                $pkgdir/usr/share/doc/$pkgname
    cp    doc/pdf/gprbuild_ug.pdf $pkgdir/usr/share/doc/$pkgname
    
    
    # Install the license.
    #
    install -D -m644 \
       LICENSE-tool  \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE-tool
}
