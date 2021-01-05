# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgbase=gprbuild
pkgname=(libgpr gprbuild)
_upstream_ver=2020-20200429-19BD2
pkgver=2020
pkgrel=6
pkgdesc="Builder for multi-language systems"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3')
makedepends=('gprbuild-bootstrap' 'xmlada')

_checksum=408ec35c3bb86bd227db3da55d3e1e0c572a56e3
source=("${pkgbase}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgbase}-${_upstream_ver}-src.tar.gz"
        'relocatable-build.patch'
        'always-use-host-gprinstall.patch')
sha1sums=("$_checksum"
          '91b20bde99cf02410cdb2b74aa1adb014458a9b3'
          '66792ebc73aff76a368bd902adc6a6f181d1d878')

prepare() {
    cd "$srcdir/$pkgbase-$_upstream_ver-src"

    patch -Np1 -i "$srcdir/relocatable-build.patch"
    # By default, it tries to use the freshly-built gprinstall to install gprbuild, but that requires libgpr,
    # which can't be installed yet. Simply fall back to gprinstall from gprbuild-bootstrap
    patch -Np1 -i "$srcdir/always-use-host-gprinstall.patch"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr \
        share/gprconfig/compilers.xml \
        share/gprconfig/linker.xml \
        share/gprconfig/gnat.xml
}

build() {
    cd "$srcdir/$pkgbase-$_upstream_ver-src"

    export OS=UNIX
    GPRBUILD_OPTIONS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
    make BUILD=production setup

    make GPRBUILD_OPTIONS="$GPRBUILD_OPTIONS" libgpr.build
    make GPRBUILD_OPTIONS="$GPRBUILD_OPTIONS" build
}

package_libgpr() {
    pkgdesc="Ada library to handle GPRbuild project files"
    depends=('xmlada')

    # both provide /usr/lib/libgpr.so
    conflicts=('grpc')

    cd "$srcdir/$pkgbase-$_upstream_ver-src"

    make prefix="$pkgdir/usr" libgpr.install
}

package_gprbuild() {
    provides=('gprbuild-bootstrap')
    conflicts=('gprbuild-bootstrap')
    depends=('libgpr' 'xmlada')
    cd "$srcdir/$pkgbase-$_upstream_ver-src"

    make prefix="$pkgdir/usr" install

    # We don't need to distribute the installation script
    rm -f -- "$pkgdir/usr/doinstall"
}
