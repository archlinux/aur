# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgbase=gpr
pkgdesc='Parser for Ada GPR project files.'
pkgname=(gpr gpr2tools)
pkgver=24.0w
pkgrel=1

url=https://github.com/AdaCore/gpr
arch=(i686 x86_64)
license=(GPL3 Apache)

depends=(gnatcoll-iconv
         gnatcoll-gmp
         python
         which
         python-funcy
         python-mako
         python-docutils)

makedepends=(gprbuild python-e3-core)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/gpr2-$pkgver-20230324-16151-src.tar.gz)
sha256sums=(e6f85d621d5161c15004657df01ae797a6cd782a8f7cf4fdbdf5b280e6840a1b)


prepare()
{
    cd $srcdir/gpr2-$pkgver-20230428-162AF-src
    make setup prefix=$pkgdir/usr GPR2KBDIR=/usr/share/gprconfig
}


build()
{
    cd $srcdir/gpr2-$pkgver-20230428-162AF-src

    make build-lib-static
    make build-lib-static-pic
    make build-lib-relocatable
    make build-tools

    make doc
    make docgen
}


package_gpr()
{
    cd $srcdir/gpr2-$pkgver-20230428-162AF-src

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
       LICENSE       \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


package_gpr2tools()
{
    provides=(gprtools)
    conflicts=(gprtools)

    cd $srcdir/gpr2-$pkgver-20230428-162AF-src

    mkdir -p $pkgdir/usr/bin
    cp  .build/release/gprclean    $pkgdir/usr/bin
    cp  .build/release/gprconfig   $pkgdir/usr/bin
    cp  .build/release/gprinstall  $pkgdir/usr/bin
    cp  .build/release/gprls       $pkgdir/usr/bin

    # Install the license.
    #
    install -D -m644 \
       COPYING3      \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3

    # Install the custom license.
    #
    install -D -m644 \
       LICENSE       \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
