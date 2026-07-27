# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatdoc
pkgdesc='GNAT documentation generation tool.'
pkgver=27.0w
pkgrel=1

url=https://github.com/AdaCore/gnatdoc
arch=(i686 x86_64)
license=(GPL-3.0-or-later Apache-2.0 custom)

depends=(gnatcoll-core markdown libadalang)
makedepends=(gprbuild)

options=(!strip)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gnatdoc4-src.tar.gz)
sha256sums=(d9f0adc837e3d0392d7cff05a9b58482abd6ff46d59025580315fbb2bc5c74ab)

_srcdir="gnatdoc4-27.0w-20260409-1625F-src"


build()
{
    cd "$srcdir/$_srcdir"

    export LIBRARY_TYPE=relocatable

    gprbuild -j0 -p -P gnat/libgnatdoc.gpr
    gprbuild -j0 -p -P gnat/gnatdoc.gpr

    ## Build the documentation.
    #
    make build-documentation   \
        1> make_docs-1.log     \
        2> make_docs-2.log
}


package()
{
    cd "$srcdir/$_srcdir"

    ## Install the binary.
    #
    gprinstall gnat/gnatdoc.gpr                              \
               --prefix="$pkgdir/usr"                        \
               --create-missing-dirs                         \
               -XGPR_UNIT_PROVIDER_LIBRARY_TYPE=relocatable  \
               -XGPR2_LIBRARY_TYPE=relocatable

    ## Install the library.
    #
    gprinstall gnat/libgnatdoc.gpr  \
               --prefix="$pkgdir/usr" \
               --create-missing-dirs

    ## Install the documentation.
    #
    PREFIX="$pkgdir/usr"        \
    make install-documentation  \
         1> install-docs-1.log  \
         2> install-docs-2.log

    ## Install the licenses.
    #
    install -D -m644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 LICENSE.APACHE-2.0         "$pkgdir/usr/share/licenses/$pkgname/LICENSE.APACHE-2.0"
    install -D -m644 LICENSE.GCC-EXCEPTION-3.1  "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GCC-EXCEPTION-3.1"
    install -D -m644 LICENSE.GPL-3.0-OR-LATER   "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL-3.0-OR-LATER"
    install -D -m644 LICENSE.LLVM-EXCEPTION     "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LLVM-EXCEPTION"
}
