# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgbase=gpr
pkgdesc='Parser for Ada GPR project files.'
pkgname=(gpr gpr2tools)
pkgver=25.0w
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

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/gpr2-$pkgver-20240409-162B5-src.tar.gz
        rid_testsuite_reference_in_docgen_target_in_Makefile.patch)
        
sha256sums=(dd893997839c5242cf2d8d1482de603ac509ece06b67a1f480b2dbfba4c6b8d6
            f7222c11e9292dc0a378f925cbdb1a9dfbcfaf599063517affca87827db9d8dd)


prepare()
{
    cd $srcdir/gpr2-$pkgver-20240505-16442-src
    make setup prefix=$pkgdir/usr GPR2KBDIR=/usr/share/gprconfig
    
    patch -Np0 -i $srcdir/rid_testsuite_reference_in_docgen_target_in_Makefile.patch
}


build()
{
    cd $srcdir/gpr2-$pkgver-20240505-16442-src

    make build-lib-static
    make build-lib-static-pic
    make build-lib-relocatable
    make build-tools

    make doc
    make docgen
}


package_gpr()
{
    cd $srcdir/gpr2-$pkgver-20240505-16442-src

    make install-libs
    make install-tools
   
    # These conflict with the binaries from 'gprbuild'.
    #
    rm $pkgdir/usr/bin/gprclean
    rm $pkgdir/usr/bin/gprconfig
    rm $pkgdir/usr/bin/gprinstall
    rm $pkgdir/usr/bin/gprls

    # Install the license.
    #
    install -D -m644 \
       COPYING3      \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3

    # Install the custom license.
    #
    install -D -m644 \
       LICENSE-lib   \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE-lib
}


package_gpr2tools()
{
    provides=(gprtools)
    conflicts=(gprtools)

    cd $srcdir/gpr2-$pkgver-20240505-16442-src

    mkdir -p $pkgdir/usr/bin
    cp  .build/release_checks/gprclean    $pkgdir/usr/bin
    cp  .build/release_checks/gprconfig   $pkgdir/usr/bin
    cp  .build/release_checks/gprinstall  $pkgdir/usr/bin
    cp  .build/release_checks/gprls       $pkgdir/usr/bin

    # Install the license.
    #
    install -D -m644 \
       LICENSE-tool  \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE-tool
}
