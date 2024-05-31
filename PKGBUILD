# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-core
pkgdesc='Gnat components collection - Core packages.'
pkgver=25.0w
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

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/$pkgname-$pkgver-20240408-16118-src.tar.gz)
sha256sums=(5b683fcc693205b25148cbd2f9adb50e0075bb75cdc867c595efc8dc70ade7fc)

_gnatcoll_core_src=gnatcoll-core-25.0w-20240505-162D8-src


build()
{
    cd $srcdir/$_gnatcoll_core_src

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"

    make -C docs html latexpdf   \
         1> build-docs-1.log     \
         2> build-docs-2.log
         
}


package()
{
    cd $srcdir/$_gnatcoll_core_src

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    #
    make -j1 prefix="$pkgdir/usr" install
    
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