# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gtkada
_upstream_ver=2020-20200429-19B96
pkgver=2020
pkgrel=1

pkgdesc='Ada bindings for the Gtk+ library.'
url='https://github.com/AdaCore/gtkada'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'gtk3')
makedepends=('gprbuild')

_checksum=96f85c875c161c36e7d0edb19aa4dbddf41ea671
source=("${pkgname}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgname}-${_upstream_ver}-src.tar.gz")
sha1sums=("$_checksum")

build()
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

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
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    make -j1 PROCESSORS=1 DESTDIR="$pkgdir" install
}
