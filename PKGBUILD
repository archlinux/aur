# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
_upstream_ver=2021-20210519-19A69
pkgver=2021
pkgrel=2

pkgdesc="Libadalang-based tools for Ada: gnatpp, gnatmetric and gnatstub"
url='https://github.com/AdaCore/libadalang-tools'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libadalang')
makedepends=('gprbuild')

_checksum=21b42a7e6ced5c227fa001eff9c9d39c75d3d58f
source=("${pkgname}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgname}-${_upstream_ver}-src.tar.gz"
        "0001-pp-actions.adb-patch-for-compatibility-with-release-.patch"
        "0002-Makefile-add-GPRBUILD_FLAGS-variable.patch"
        "0003-Makefile-don-t-force-j-to-be-passed-to-gprbuild.patch"
)
sha1sums=('21b42a7e6ced5c227fa001eff9c9d39c75d3d58f'
          'ef13af536f419fb8181810b17a5feebff1b98342'
          '31bc3f4b157782e95dc7cdbc3185e4f74f7fc576'
          'af4b98efc227ac64c02f5dde4b20e39c8c967470')

prepare()
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    patch -p1 < "$srcdir/0001-pp-actions.adb-patch-for-compatibility-with-release-.patch"
    patch -p1 < "$srcdir/0002-Makefile-add-GPRBUILD_FLAGS-variable.patch"
    patch -p1 < "$srcdir/0003-Makefile-don-t-force-j-to-be-passed-to-gprbuild.patch"
}

build()
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    make -j1 \
        BUILD_MODE=prod \
        LIBRARY_TYPE=relocatable \
        GPRBUILD_FLAGS="-R -j$(nproc) -cargs $ADA_FLAGS -largs $LDFLAGS" \
        bin lib
}

package()
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    make DESTDIR="$pkgdir/usr/" install-lib
    install -Dm755 -t "$pkgdir/usr/bin/" bin/{gnatpp,gnatmetric,gnatstub}

    # Install the license.
    install -D -m644 \
       "COPYING3"    \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}

# vim: set et ts=4:
