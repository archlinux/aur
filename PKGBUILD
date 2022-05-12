# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild-bootstrap
epoch=1
pkgver=22.0.0
pkgrel=1
pkgdesc="Static GPRbuild to bootstrap XML/Ada and GPRbuild itself"
arch=('i686' 'x86_64')
url='https://github.com/AdaCore/gprbuild/'
license=('GPL3' 'custom')
depends=('gcc-ada')

source=(
	"gprbuild-$pkgver.tar.gz::https://github.com/AdaCore/gprbuild/archive/v$pkgver.tar.gz"
	"xmlada-$pkgver.tar.gz::https://github.com/AdaCore/xmlada/archive/v$pkgver.tar.gz"
	"gprconfig_kb-$pkgver.tar.gz::https://github.com/AdaCore/gprconfig_kb/archive/v$pkgver.tar.gz"
)
sha256sums=('076e2b6ac0c7170753a6499094a6d30a98698aca2551c6796b3a617dd9ffc704'
            '853ed895defd395c0bc96c23a50812168b656b31befc1336f45c5541f2bec06d'
            'cc19437e0982d9af31e09ad7c42eac6a445dac65336bd53d67ba61f630be7f13')

prepare() {
    cd "$srcdir/gprbuild-$pkgver"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr \
        "$srcdir/gprconfig_kb-$pkgver/db/compilers.xml" \
        "$srcdir/gprconfig_kb-$pkgver/db/linker.xml" \
        "$srcdir/gprconfig_kb-$pkgver/db/gnat.xml"
}

build() {
    cd "$srcdir/gprbuild-$pkgver"

    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    GNATMAKEFLAGS="$MAKEFLAGS"

    ./bootstrap.sh \
        --with-xmlada="$srcdir/xmlada-$pkgver" \
        --with-kb="$srcdir/gprconfig_kb-$pkgver" \
        --build
}

package() {
    cd "$srcdir/gprbuild-$pkgver"

    env DESTDIR="$pkgdir" ./bootstrap.sh \
        --with-kb="$srcdir/gprconfig_kb-$pkgver" \
        --prefix=/usr \
        --libexecdir=/lib \
        --install

    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}

# vim: set et ts=4:
