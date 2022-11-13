# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gtkada
epoch=1
pkgver=23.0.0
pkgrel=1

pkgdesc='Ada bindings for the Gtk+ library.'
url='https://github.com/AdaCore/gtkada'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('gcc-ada' 'gtk3')
makedepends=('gprbuild')

_git_hash=194c463153cf909722545765f1eb702e655df3d3

source=("$pkgname-$_git_hash.tar.gz::$url/archive/$_git_hash.tar.gz"
        "Makefile.in-patch")
sha256sums=("84fdf8dab32e64cc9a1a2256ad3ddb5ff452179d6f9c877ff41b2d9210f88868"
            "f525df1f7c319f1dc95ddafe1a73d961ce162c6171c97b0df3ae756122ca76d4")

prepare()
{
    cd "$srcdir/$pkgname-$_git_hash"
    patch -Np1 -i ../Makefile.in-patch
}

build()
{
    cd "$srcdir/$pkgname-$_git_hash"

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
    cd "$srcdir/$pkgname-$_git_hash"

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
