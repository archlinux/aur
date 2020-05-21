# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild-bootstrap
_gprbuild_ver=2020-20200429-19BD2
_xmlada_ver=2020-20200429-19A99
pkgver=2020
pkgrel=2
pkgdesc="Static GPRbuild to bootstrap XML/Ada and GPRbuild itself"
arch=('i686' 'x86_64')
url='https://github.com/AdaCore/gprbuild/'
license=('GPL3')
depends=('gcc-ada')

_gprbuild_checksum=408ec35c3bb86bd227db3da55d3e1e0c572a56e3
_xmlada_checksum=c799502295baf074ad17b48c50f621879c392c57
source=("gprbuild-$_gprbuild_ver-src.tar.gz::https://community.download.adacore.com/v1/${_gprbuild_checksum}?filename=gprbuild-$_gprbuild_ver-src.tar.gz"
        "xmlada-$_xmlada_ver-src.tar.gz::https://community.download.adacore.com/v1/${_xmlada_checksum}?filename=xmlada-$_xmlada_ver-src.tar.gz")
sha1sums=("$_gprbuild_checksum"
          "$_xmlada_checksum")

prepare() {
    cd "$srcdir/gprbuild-${_gprbuild_ver}-src"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr \
        share/gprconfig/compilers.xml \
        share/gprconfig/linker.xml \
        share/gprconfig/gnat.xml
}

build() {
    cd "$srcdir/gprbuild-$_gprbuild_ver-src"

    export GNATMAKEFLAGS="-j$(nproc)"
    export DESTDIR="$srcdir/bootstrap"

    ./bootstrap.sh \
        --prefix=/usr \
        --libexecdir=/lib \
        --with-xmlada="$srcdir/xmlada-$_xmlada_ver-src"
}

package() {
    cd "$srcdir/bootstrap"
    cp -a --no-preserve=ownership -- "$srcdir/bootstrap/usr" "$pkgdir"
}
