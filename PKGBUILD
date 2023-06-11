# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gtkada
pkgdesc='Ada bindings for the Gtk+ library.'
pkgver=24.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/gtkada
arch=(i686 x86_64)
license=(GPL3 custom)

depends=(gcc-ada gtk3)
makedepends=(gprbuild)

#source=(file:///opt/gnatstudio-sources/$pkgname-$pkgver-20230428-165F0-src.tar.gz
source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/$pkgname-$pkgver-20230428-165F0-src.tar.gz
        Makefile.in-patch)
sha256sums=(596d19722c0b7f6ec67d0f00918a2bfb0ae0fb7352b2182a290d5dcdf31e1ba9
            f525df1f7c319f1dc95ddafe1a73d961ce162c6171c97b0df3ae756122ca76d4)

_gtkada_src=gtkada-$pkgver-20230428-165F0-src


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

    # Defer making docs til 'gnatdoc' is split out of gnatstudio source.
    #
    # make docs
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