# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-core
pkgdesc='Gnat components collection - Core packages.'
pkgver=26.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/gnatcoll-core
arch=(i686 x86_64)
license=(GPL3 custom)

depends=(libgpr)
makedepends=(gprbuild-toolbox
             python-sphinx
             python-sphinx_rtd_theme
             texlive-meta)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/gnatcoll-core-26.0w-20250410-161C5-src.tar.gz)
sha256sums=(e8192694d4a957c0257302e3ff4f6aad93a03fb7b5a05462ab0ef96e67a73724)

_gnatcoll_core_src=gnatcoll-core-26.0w-20250417-16242-src


build()
{
    cd $srcdir/$_gnatcoll_core_src

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    make -j1 BUILD=PROD GPRBUILD_OPTIONS="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"

    make -C docs html latexpdf      \
         1> build-docs-warnings.log \
         2> build-docs-errors.log
}


package()
{
    cd $srcdir/$_gnatcoll_core_src

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    #
    make -j1 prefix="$pkgdir/usr" install
    
    
    # Install the documentation.
    #
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    
    cp -r docs/_build/html               $pkgdir/usr/share/doc/$pkgname
    cp    docs/_build/latex/GNATColl.pdf $pkgdir/usr/share/doc/$pkgname
    
    
    # Install the license.
    #
    install -D -m644 \
       COPYING3      \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3

    # Install the custom license.
    #
    install -D -m644   \
       COPYING.RUNTIME \
       $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}