# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gtkada
pkgdesc='Ada bindings for the Gtk+ library.'
pkgver=26.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/gtkada
arch=(i686 x86_64)
license=(GPL3 custom)

depends=(gcc-ada
         gtk3)
makedepends=(gprbuild-toolbox
             python-sphinx
             python-sphinx_rtd_theme
             texlive-meta)
#             gnatdoc)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/gtkada-26.0w-20250416-16402-src.tar.gz
        Makefile.in-patch)
sha256sums=(8ce12d3093544959a15c66e48652b45fbbe8f76c79a2ffab26cb7dbfb98f7dc0
            f525df1f7c319f1dc95ddafe1a73d961ce162c6171c97b0df3ae756122ca76d4)

_gtkada_src=gtkada-26.0w-20250416-16402-src


prepare()
{
    cd $srcdir/$_gtkada_src
    patch -Np1 -i ../Makefile.in-patch
}


build()
{
    cd $srcdir/$_gtkada_src

    ./configure --prefix=/usr

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    # Disable RPATH usage with -R.
    # Only use a single job (-j1) to prevent the same file being compiled simultaneously
    # which results in build artifacts being overwritten.
    #
    make -j1 GPRBUILD_SWITCHES="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"

#    make docs
}


package()
{
    cd $srcdir/$_gtkada_src

    make -j1 PROCESSORS=1 DESTDIR=$pkgdir install
    
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