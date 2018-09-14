# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild-bootstrap
pkgver=2018
pkgrel=3
pkgdesc="Static GPRbuild to bootstrap XML/Ada and GPRbuild itself"
arch=('i686' 'x86_64')
url='https://github.com/AdaCore/gprbuild/'
license=('GPL3')
depends=('gcc-ada>=8.2.1' 'gcc-ada<9.0.0')

source=('http://mirrors.cdn.adacore.com/art/5b0819dfc7a447df26c27a68'
        'http://mirrors.cdn.adacore.com/art/5b0819dec7a447df26c27a40')
sha1sums=(f2cfc62fc05ae510e7e3aa7138d27ccb38096bdd
          6b01f6c7ac9d0766320738bef1d32894b34195e8)

prepare() {
    cd "$srcdir/gprbuild-gpl-2018-src"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr \
        share/gprconfig/compilers.xml \
        share/gprconfig/linker.xml \
        share/gprconfig/gnat.xml
}

build() {
    cd "$srcdir/gprbuild-gpl-2018-src"

    export GNATMAKEFLAGS="-j$(nproc)"
    export DESTDIR="$srcdir/bootstrap"

    ./bootstrap.sh \
        --prefix=/usr \
        --libexecdir=/lib \
        --with-xmlada="$srcdir/xmlada-gpl-2018-src"
}

package() {
    cd "$srcdir/bootstrap"
    cp -a --no-preserve=ownership -- "$srcdir/bootstrap/usr" "$pkgdir"
}
