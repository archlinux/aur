# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-postgres
epoch=1
pkgver=22.0.0
pkgrel=4
_repo_name=gnatcoll-db

pkgdesc='GNAT Components Collection - Postgres database support'
url='https://github.com/AdaCore/gnatcoll-db/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('gnatcoll-sql' 'postgresql')
makedepends=('gprbuild')

source=("https://github.com/AdaCore/gnatcoll-db/archive/refs/tags/v22.0.0.tar.gz")
sha256sums=('8d29e2047adac2de8bc20ae50d12fe6759428197079082d246d7f1cd480d380f')

build()
{
    cd "$srcdir/$_repo_name-$pkgver/postgres"

    # Rid flags not used by Ada.
    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
}

package()
{
    cd "$srcdir/$_repo_name-$pkgver/postgres"

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
