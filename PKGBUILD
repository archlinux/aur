# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at irc.libera.chat>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgbase=gprbuild
pkgdesc="Builder for multi-language systems."
pkgname=(libgpr gprbuild gprtools gprname gprslave)
pkgver=24.0w
pkgrel=4
epoch=1

arch=(i686 x86_64)
url=https://github.com/AdaCore/gprbuild/
license=(GPL3 custom)

depends=(gcc-ada xmlada)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/gprbuild-$pkgver-20230324-1649D-src.tar.gz
        https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/gprconfig-kb-$pkgver-20230324-16644-src.tar.gz
        0001-Makefile-build-relocatable-instead-of-static-binary.patch)

sha256sums=(efeb12ab26ca687a000ca781f3bce0e4ec2d4efd62b996116f2f505e50239b4f
            7de5388f05168fb32577556989f0bc0f4f4d615cbd6a79ad544127a090aba5f4
            6ebbea41d4b8b516d0646438338fb228ea907600a2ad2c594bab41a7e1c3680c)

_gprbuild_src=gprbuild-$pkgver-20230430-16222-src
_gprconfig_kb_src=gprconfig-kb-$pkgver-20230428-16586-src


prepare()
{
    cd $srcdir/$_gprbuild_src
    patch -Np1 -i $srcdir/0001-Makefile-build-relocatable-instead-of-static-binary.patch

    ln -sfT $srcdir/gprconfig_kb-$pkgver/db/ share/gprconfig

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    #
    sed -i 's/libexec/lib/g'                        \
        doinstall gprbuild.gpr                      \
        $srcdir/$_gprconfig_kb_src/db/compilers.xml \
        $srcdir/$_gprconfig_kb_src/db/linker.xml    \
        $srcdir/$_gprconfig_kb_src/db/gnat.xml
}


build()
{
    cd $srcdir/$_gprbuild_src

    export OS=UNIX

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    GPRBUILD_OPTIONS="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"
    make BUILD=production setup

    make GPRBUILD_OPTIONS="$GPRBUILD_OPTIONS" libgpr.build
    make GPRBUILD_OPTIONS="$GPRBUILD_OPTIONS" build
    
    cd doc
    make html txt info texinfo
}


_install_licenses()
{
    cd $srcdir/$_gprbuild_src

    # Install the license.
    #
    install -D -m644     \
       COPYING3          \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3

    # Install the custom license.
    #
    install -D -m644     \
       COPYING.RUNTIME   \
       $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}


package_libgpr()
{
    pkgdesc="Ada library to handle Gnat project files."
    depends=(xmlada)

    # Both provide /usr/lib/libgpr.so
    #
    conflicts=(grpc)

    cd $srcdir/$_gprbuild_src

    make prefix=$pkgdir/usr libgpr.install
    _install_licenses
}


package_gprbuild()
{
    conflicts=(gprbuild-bootstrap)

    cd $srcdir/$_gprbuild_src

    make prefix=$pkgdir/usr install

    rm  $pkgdir/usr/bin/gprclean
    rm  $pkgdir/usr/bin/gprconfig
    rm  $pkgdir/usr/bin/gprinstall
    rm  $pkgdir/usr/bin/gprls
    rm  $pkgdir/usr/bin/gprslave
    rm  $pkgdir/usr/bin/gprname

    _install_licenses

    # We don't need to distribute the installation script.
    #
    rm -f -- $pkgdir/usr/doinstall

    # Install the knowledge base.
    #
    cp -fr $srcdir/gprconfig-kb-24.0w-20230428-16586-src/db \
           $pkgdir/usr/share/gprconfig
}


package_gprtools()
{
    conflicts=(gprbuild-bootstrap)

    cd $srcdir/$_gprbuild_src

    mkdir -p $pkgdir/usr/bin

    cp  exe/production/gprclean    $pkgdir/usr/bin
    cp  exe/production/gprconfig   $pkgdir/usr/bin
    cp  exe/production/gprinstall  $pkgdir/usr/bin
    cp  exe/production/gprls       $pkgdir/usr/bin

    _install_licenses
}


package_gprname()
{
    conflicts=(gprbuild-bootstrap)

    cd $srcdir/$_gprbuild_src

    mkdir -p $pkgdir/usr/bin
    cp  exe/production/gprname  $pkgdir/usr/bin

    _install_licenses
}


package_gprslave()
{
    cd $srcdir/$_gprbuild_src

    mkdir -p $pkgdir/usr/bin
    cp  exe/production/gprslave  $pkgdir/usr/bin

    _install_licenses
}