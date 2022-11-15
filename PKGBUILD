# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gtkada
epoch=1
pkgver=23.0.0
pkgrel=2

pkgdesc='Ada bindings for the Gtk+ library.'
url='https://github.com/AdaCore/gtkada'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('gcc-ada' 'gtk3')
makedepends=('gprbuild')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "Makefile.in-patch")
sha256sums=("011d47f7ea8dbebd5489d6933572a618fcf3ea8b1bbfb3d60622752269cec087"
            "f525df1f7c319f1dc95ddafe1a73d961ce162c6171c97b0df3ae756122ca76d4")

prepare()
{
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i ../Makefile.in-patch
}

build()
{
    cd "$srcdir/$pkgname-$pkgver"

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
    # make docs
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    make -j1 PROCESSORS=1 DESTDIR="$pkgdir" install
    
    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}
