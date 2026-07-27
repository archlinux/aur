# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgbase=gpr
pkgdesc='Parser for Ada GPR project files.'
pkgname=(gpr gpr2tools)
pkgver=27.0w
pkgrel=1

_srcname=gpr2-27.0w-20260324-164D3-src

url='https://github.com/AdaCore/gpr'
arch=(i686 x86_64)
license=(GPL-3.0-only Apache-2.0)


depends=(gnatcoll-iconv
         gnatcoll-gmp
         langkit
         python
         which
         python-funcy
         python-mako
         python-docutils)

makedepends=(gprbuild python-e3-core)


source=("https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gpr2-src.tar.gz")
sha256sums=('24558c997acd35e755dbc58d8e6ad8ce2ba680e7b5a90c63e6d03f1311b8a38d')


prepare()
{
    cd "$srcdir/$_srcname"

    sed -i 's/libexec/lib/g' tools/projects/gpr2tools.gpr
}


build()
{
    cd "$srcdir/$_srcname"


    make setup prefix="$pkgdir/usr" GPR2KBDIR=/usr/share/gprconfig ENABLE_SHARED=yes
    make -j1     # Building w/o -j1 can cause gcc to crash.


    ## Generate documentation.
    #
    make -C doc \
         html pdf \
         1>build-docs-warnings.log \
         2>build-docs-errors.log

    make -C doc/gpr2_user_manual \
         all \
         1>build-user_manual-warnings.log \
         2>build-user_manual-errors.log
}


package_gpr()
{
    pkgdesc='Ada GPR project file parser library.'
    depends=(gnatcoll-iconv gnatcoll-gmp langkit)

    cd "$srcdir/$_srcname"


    make -j1 install-libs

    cp "$pkgdir/usr/include/gpr2.static/"* \
       "$pkgdir/usr/include/gpr2.relocatable/"


    ## Install the documentation.
    #
    install -d "$pkgdir/usr/share/doc/$pkgname"

    cp -r doc/gpr2_user_manual/build/html \
          "$pkgdir/usr/share/doc/$pkgname/"
    cp    doc/gpr2_user_manual/build/latex/gpr2libraryusermanual.pdf \
          "$pkgdir/usr/share/doc/$pkgname/"


    ## Install the license.
    #
    install -Dm644 LICENSE-lib \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-lib"
}


package_gpr2tools()
{
    pkgdesc='Ada GPR project file parser tools.'
    depends=(gpr python python-funcy python-mako python-docutils which)

    cd "$srcdir/$_srcname"


    make -j1 prefix="$pkgdir/usr" install-tools

    mv "$pkgdir/usr/share/examples/gprbuild" \
       "$pkgdir/usr/share/examples/gprbuild2"                 # Conflicts with 'gprbuild' package.
    
    mv "$pkgdir/usr/bin/gprconfig" \
       "$pkgdir/usr/bin/gprconfig2"                           # Conflicts with 'gprbuild' package.

    mv "$pkgdir/usr/bin/gprbuild" \
       "$pkgdir/usr/bin/gprbuild2"                            # Conflicts with 'gprbuild' package.

    mv "$pkgdir/usr/bin/gprclean" \
       "$pkgdir/usr/bin/gprclean2"                            # Conflicts with 'gprbuild' package.

    mv "$pkgdir/usr/bin/gprinstall" \
       "$pkgdir/usr/bin/gprinstall2"                          # Conflicts with 'gprbuild' package.


    ## Install the documentation.
    #
    install -d "$pkgdir/usr/share/doc/$pkgname"

    cp -r doc/html \
          "$pkgdir/usr/share/doc/$pkgname/"
    cp    doc/pdf/gprbuild_ug.pdf \
          "$pkgdir/usr/share/doc/$pkgname/"


    ## Install the license.
    #
    install -Dm644 LICENSE-tool \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-tool"
}
