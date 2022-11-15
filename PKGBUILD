# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild-bootstrap
epoch=1
pkgver=23.0.0
pkgrel=1
pkgdesc="Static GPRbuild to bootstrap XML/Ada and GPRbuild itself"
arch=('i686' 'x86_64')
url='https://github.com/AdaCore/gprbuild/'
license=('GPL3' 'custom')
depends=('gcc-ada')

source=("gprbuild-$pkgver.tar.gz::https://github.com/AdaCore/gprbuild/archive/v$pkgver.tar.gz"
        "xmlada-$pkgver.tar.gz::https://github.com/AdaCore/xmlada/archive/v$pkgver.tar.gz"
        "gprconfig_kb-$pkgver.tar.gz::https://github.com/AdaCore/gprconfig_kb/archive/v$pkgver.tar.gz")

sha256sums=('141b403ea8a3f82b58b6a8690f8409fe295f3692b667ba3ec487fafcbd26e389'
            '66245a68f2e391c8dc8dc50d6d5f109eb3b371e261d095d2002dff3927dd5253'
            '182d9108c91390ddd67c841e45a3fc9dd23a94b33d4a1f05ed2788c1fb9b7dd2')

prepare()
{
    cd "$srcdir/gprbuild-$pkgver"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr     \
        "$srcdir/gprconfig_kb-$pkgver/db/compilers.xml" \
        "$srcdir/gprconfig_kb-$pkgver/db/linker.xml"    \
        "$srcdir/gprconfig_kb-$pkgver/db/gnat.xml"
}

build()
{
    cd "$srcdir/gprbuild-$pkgver"

    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    GNATMAKEFLAGS="$MAKEFLAGS"

    ./bootstrap.sh                               \
        --with-xmlada="$srcdir/xmlada-$pkgver"   \
        --with-kb="$srcdir/gprconfig_kb-$pkgver" \
        --build
}

package()
{
    cd "$srcdir/gprbuild-$pkgver"

    env DESTDIR="$pkgdir" ./bootstrap.sh         \
        --with-kb="$srcdir/gprconfig_kb-$pkgver" \
        --prefix=/usr                            \
        --libexecdir=/lib                        \
        --install

    # Install the license.
    install -D -m644 \
       "COPYING3"    \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}

# vim: set et ts=4:
