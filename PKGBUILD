# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gtkada
epoch=1
pkgver=21.0.0
pkgrel=2

pkgdesc='Ada bindings for the Gtk+ library.'
url='https://github.com/AdaCore/gtkada'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'gtk3')
makedepends=('gprbuild')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('f69c974e8067a651bd62a4f3fcc1b127')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    export LIBRARY_TYPE=relocatable

    # XXX Disable opengl https://github.com/AdaCore/gtkada/issues/9
    ./configure --prefix=/usr --with-GL=no

    # Disable RPATH usage with -R.
    # Only use a single job (-j1) to prevent the same file being compiled simultaneously
    # which results in build artifacts being overwritten.
    #
    make -j1 GPRBUILD_SWITCHES="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
}


package()
{
    cd "$srcdir/$pkgname-$pkgver"

    make -j1 PROCESSORS=1 DESTDIR="$pkgdir" install
}
