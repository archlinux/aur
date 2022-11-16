# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
epoch=1
pkgver=23.0.0
pkgrel=1

pkgdesc="Libadalang-based tools for Ada: gnatpp, gnatmetric and gnatstub"
url='https://github.com/AdaCore/libadalang-tools'
arch=('i686' 'x86_64')
license=('GPL3')

depends=('ada-web-server' 'libadalang')
makedepends=('gprbuild' 'which')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "0002-Makefile-add-GPRBUILD_FLAGS-variable.patch"
        "0003-Makefile-don-t-force-j-to-be-passed-to-gprbuild.patch")

sha256sums=('c6e06d7d0df874cab2b61530165f94b93ebd900b59735ff702b2f9d70456faa6'
            'c71fcd7a535c348c24ba984186d3663f41085296e8dc7b79c06bb9d85fabf419'
            '627fd033fd90630c0b5cf24dff4ca6537c903215148384b966567986c17f63aa')

prepare()
{
    cd "$srcdir/$pkgname-$pkgver"

    patch -p1 < "$srcdir/0002-Makefile-add-GPRBUILD_FLAGS-variable.patch"
    patch -p1 < "$srcdir/0003-Makefile-don-t-force-j-to-be-passed-to-gprbuild.patch"
}

build()
{
    cd "$srcdir/$pkgname-$pkgver"

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
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir/usr/"   \
         install-lib

    install -Dm755 -t "$pkgdir/usr/bin/" bin/{gnatpp,gnatmetric,gnatstub}

    # Install the license.
    install -D -m644 \
       "LICENSE"     \
       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set et ts=4: