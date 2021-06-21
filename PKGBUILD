# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-core
epoch=1
pkgver=21.0.0
pkgrel=2

pkgdesc='Gnat components collection - Core packages.'
url='https://github.com/AdaCore/gnatcoll-core/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('libgpr')
makedepends=('gprbuild')

conflicts=('gnatcoll' 'gnatcoll-core-git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('daa9b3d5fc5d90b015ece1b48d54192bd06a71fec64bdfc242066f2598c30ff5')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1
    
    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
    
}
