# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-core
pkgdesc='Gnat components collection - Core packages.'
pkgver=24.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/gnatcoll-core
arch=(i686 x86_64)
license=(GPL3 custom)

depends=(libgpr)
makedepends=(gprbuild-toolbox
             python-sphinx
             python-sphinx_rtd_theme
#             texlive-core
#             texlive-latexextra
#             texlive-latexrecommended
             texlive-meta)

#https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/gnatcoll-core-24.0w-20230324-161A8-src.tar.gz
source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/$pkgname-$pkgver-20230324-161A8-src.tar.gz)
sha256sums=(4698c52bac871cd50aac2a2f305dfe8511731bc17b716400837a5f1f27166505)

_gnatcoll_core_src=$pkgname-$pkgver-20230428-16442-src


build()
{
    cd $srcdir/$_gnatcoll_core_src

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"
    make -C docs html latexpdf
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