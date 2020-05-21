# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild
_upstream_ver=2020-20200429-19BD2
pkgver=2020
pkgrel=4
pkgdesc="Builder for multi-language systems"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3')
depends=('libgpr')
makedepends=('gprbuild-bootstrap')
provides=("gprbuild-bootstrap")
conflicts=("gprbuild-bootstrap")

_checksum=408ec35c3bb86bd227db3da55d3e1e0c572a56e3
source=("${pkgname}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgname}-${_upstream_ver}-src.tar.gz"
        'relocatable-build.patch'
        'expose-cargs-and-largs-makefile.patch')
sha1sums=('408ec35c3bb86bd227db3da55d3e1e0c572a56e3'
          '91b20bde99cf02410cdb2b74aa1adb014458a9b3'
          'ddaf20842ed9879c3f1cb24b3eb7615d5cfe61a5')

prepare() {
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    patch -Np1 -i "$srcdir/relocatable-build.patch"
    patch -Np1 -i "$srcdir/expose-cargs-and-largs-makefile.patch"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr \
        share/gprconfig/compilers.xml \
        share/gprconfig/linker.xml \
        share/gprconfig/gnat.xml
}

build() {
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    # Make using a single job (-j1) to avoid the same file being compiled at the same time.
    export OS=UNIX
    make -j1 prefix=/usr BUILD=production setup
    make -j1 GPRBUILD_OPTIONS=-R BUILD=production
}

package() {
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1  BUILD=production

    # We don't need to distribute the installation script
    rm -f -- "$pkgdir/usr/doinstall"
}
