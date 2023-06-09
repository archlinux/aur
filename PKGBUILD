# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

epoch=1

pkgname=gnatcoll-db2ada
pkgver=24.0w
pkgrel=1
pkgdesc='GNAT Components Collection - Tool to generate Ada code from database schemas.'

_repo_name=gnatcoll-db

url=https://github.com/AdaCore/gnatcoll-db
arch=(i686 x86_64)
license=(GPL3 custom)

depends=(gnatcoll-core gnatcoll-sql python)
makedepends=(gprbuild)

source=(file:///opt/gnatstudio-sources/$_repo_name-$pkgver-20230324-166CC-src.tar.gz)
sha256sums=(374adf9064cbdf87c4c3f4cc815d8c0f914820a0caa45edd605545ee7a4c07c2)

_source_dir=$_repo_name-$pkgver-20230428-1640B-src


build()
{
    cd $srcdir/$_source_dir/gnatcoll_db2ada

    # Rid flags not used by Ada.
    #
    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
}


package()
{
    cd $srcdir/$_source_dir/gnatcoll_db2ada

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    #
    make prefix=$pkgdir/usr install -j1

    # Install the license.
    #
    install -D -m644 \
       "../COPYING3" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    #
    install -D -m644      \
       ../COPYING.RUNTIME \
       $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}