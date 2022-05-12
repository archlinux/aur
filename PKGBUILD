# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild-bootstrap
epoch=1
pkgver=21.0.0
pkgrel=3
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
sha256sums=('54b7d1a3298160109aaee4d8c263c1ab3ab4abae75d354f3e90a4c51639167a2'
            '923024931f0c57451aa52cb9a3333874646102cb75957f27e3689670f90edc1e'
            '2aec26afad5bb1a4685d9c041c9c797ff5beda211a5e81f2a97452d2ceabc557')

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
