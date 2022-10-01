# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
pkgver=2022
pkgrel=2

pkgdesc="Libadalang-based tools for Ada: gnatpp, gnatmetric and gnatstub"
url='https://github.com/AdaCore/libadalang-tools'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libadalang')
makedepends=('gprbuild' 'which')

source=("https://github.com/AdaCore/libadalang-tools/archive/refs/tags/v22.0.0.tar.gz"
        "0001-pp-actions.adb-patch-for-compatibility-with-release-.patch"
        "0002-Makefile-add-GPRBUILD_FLAGS-variable.patch"
        "0003-Makefile-don-t-force-j-to-be-passed-to-gprbuild.patch"
)
sha1sums=('a71465b19d099a1a0f9bcaf029ede067c388c187'
          'ef13af536f419fb8181810b17a5feebff1b98342'
          '31bc3f4b157782e95dc7cdbc3185e4f74f7fc576'
          'af4b98efc227ac64c02f5dde4b20e39c8c967470')

prepare()
{
    cd "$srcdir/libadalang-tools-22.0.0"

    patch -p1 < "$srcdir/0001-pp-actions.adb-patch-for-compatibility-with-release-.patch"
    patch -p1 < "$srcdir/0002-Makefile-add-GPRBUILD_FLAGS-variable.patch"
    patch -p1 < "$srcdir/0003-Makefile-don-t-force-j-to-be-passed-to-gprbuild.patch"
}

build()
{
    cd "$srcdir/libadalang-tools-22.0.0"

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    make -j1                                                             \
        BUILD_MODE=prod                                                  \
        LIBRARY_TYPE=relocatable                                         \
        GPRBUILD_FLAGS="-R -j$(nproc) -cargs $ADA_FLAGS -largs $LDFLAGS" \
        bin lib
}

package()
{
    cd "$srcdir/libadalang-tools-22.0.0"

    make DESTDIR="$pkgdir/usr/"   \
         install-lib

    install -Dm755 -t "$pkgdir/usr/bin/" bin/{gnatpp,gnatmetric,gnatstub}

    # Install the license.
    install -D -m644 \
       "LICENSE"     \
       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set et ts=4: