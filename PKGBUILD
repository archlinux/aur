# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-gnatinspect
epoch=1
pkgver=23.0.0
pkgrel=1
_repo_name=gnatcoll-db

pkgdesc='GNAT Components Collection - the gnatinspect tool.'
url='https://github.com/AdaCore/gnatcoll-db/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('gnatcoll-readline' 'gnatcoll-xref')
makedepends=('gprbuild')

source=("$_repo_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0a4cc9f9c034be34ca4d08ae2c8fedce66c462719a2e1035d916559f6eee7a4d')

build()
{
    cd "$srcdir/$_repo_name-$pkgver/gnatinspect"

    # Rid flags not used by Ada.
    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
}

package()
{
    cd "$srcdir/$_repo_name-$pkgver/gnatinspect"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1

    # Install the license.
    install -D -m644     \
       "../COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "../COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}
