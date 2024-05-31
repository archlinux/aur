# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at irc.libera.chat>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgbase=gprbuild
pkgdesc="Builder for multi-language systems."
pkgname=(libgpr gprbuild gprtools gprname gprslave)
pkgver=25.0w
pkgrel=1
epoch=1

arch=(i686 x86_64)
url=https://github.com/AdaCore/gprbuild/
license=(GPL3 custom)

depends=(gcc-ada xmlada)
makedepends=(gprbuild python-sphinx)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/gprbuild-25.0w-20240408-162DA-src.tar.gz
        https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/gprconfig-kb-25.0w-20240408-16484-src.tar.gz
        0001-Makefile-build-relocatable-instead-of-static-binary.patch
        gpr.gpr-patch)

sha256sums=(6c3cd17bc972ebcb470edefd1fa1d79f39fee902e4ca0251da56654dcb5c55ab
            f8e3d74d9a0c5cb82256831603e00198dcfab7d7e5a0c5c8370a4a8ea7031f1f
            96df34fab3c61790a7af8db2659a59ce9c8f767d712e9d999e50778bce259db1
            b4a31b4f23c1a040eebad26aff6c771d04afe0b9d7da19c97ef9fde9bceed3db)


_gprbuild_src=gprbuild-$pkgver-20240505-164AB-src
_gprconfig_kb_src=gprconfig-kb-$pkgver-20240505-16517-src


prepare()
{
    cd $srcdir/$_gprbuild_src
    patch -Np0 -i $srcdir/0001-Makefile-build-relocatable-instead-of-static-binary.patch
    patch -Np0 -i $srcdir/gpr.gpr-patch     # Rename 'libgpr.so' to 'libgpr-gnat.so' to prevent name clash with the 'grpc' package.

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
    make html                \
         1> doc-make-1.log   \
         2> doc-make-2.log
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

    cd $srcdir/$_gprbuild_src

    make prefix=$pkgdir/usr libgpr.install
    _install_licenses
}


package_gprbuild()
{
    depends=(libgpr)
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
    cp -fr $srcdir/$_gprconfig_kb_src/db \
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