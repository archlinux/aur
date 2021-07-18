# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gtkada
epoch=1
pkgver=21.0.0
pkgrel=5

pkgdesc='Ada bindings for the Gtk+ library.'
url='https://github.com/AdaCore/gtkada'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('gcc-ada' 'gtk3')
makedepends=('gprbuild')

_git_hash=013b6f475704f6c75a1d38592b159e3af765391b

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_git_hash.tar.gz"
        "Makefile.in-patch")
md5sums=("385690daefa47a35c16a2f48bd5cfa4c"
         "fbf1d0e9adf74b03e85fb2d698fe7b85")

prepare()
{
    cd "$srcdir/$pkgname-$_git_hash"
    patch -Np1 -i ../Makefile.in-patch
}

build()
{
    cd "$srcdir/$pkgname-$_git_hash"

    # XXX Disable opengl https://github.com/AdaCore/gtkada/issues/9
    ./configure --prefix=/usr --with-GL=no

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
