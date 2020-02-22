# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild-bootstrap
pkgver=2019
pkgrel=2
pkgdesc="Static GPRbuild to bootstrap XML/Ada and GPRbuild itself"
arch=('i686' 'x86_64')
url='https://github.com/AdaCore/gprbuild/'
license=('GPL3')
depends=('gcc-ada')

source=('https://community.download.adacore.com/v1/0c03c05cef70b85144ba0e624a46e8952183b666?filename=gprbuild-2019-20190517-194D8-src.tar.gz'
        'https://community.download.adacore.com/v1/ce0b67754f149cd230ba842effeff0ab3033ed0c?filename=xmlada-2019-20190429-19B9D-src.tar.gz')
sha1sums=(0c03c05cef70b85144ba0e624a46e8952183b666
          ce0b67754f149cd230ba842effeff0ab3033ed0c)

prepare() {
    cd "$srcdir/gprbuild-2019-20190517-194D8-src"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr \
        share/gprconfig/compilers.xml \
        share/gprconfig/linker.xml \
        share/gprconfig/gnat.xml
}

build() {
    cd "$srcdir/gprbuild-2019-20190517-194D8-src"

    export GNATMAKEFLAGS="-j$(nproc)"
    export DESTDIR="$srcdir/bootstrap"

    ./bootstrap.sh \
        --prefix=/usr \
        --libexecdir=/lib \
        --with-xmlada="$srcdir/xmlada-2019-20190429-19B9D-src"
}

package() {
    cd "$srcdir/bootstrap"
    cp -a --no-preserve=ownership -- "$srcdir/bootstrap/usr" "$pkgdir"
}
