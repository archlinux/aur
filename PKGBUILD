# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=libgpr
_upstream_ver=2020-20200429-19BD2
pkgver=2020
pkgrel=1
pkgdesc="Ada library to handle GPRbuild project files"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3')
depends=('xmlada')
makedepends=('gprbuild-bootstrap')

_checksum=408ec35c3bb86bd227db3da55d3e1e0c572a56e3
source=("https://community.download.adacore.com/v1/${_checksum}?filename=gprbuild-${_upstream_ver}-src.tar.gz"
        'relocatable-build.patch'
        'expose-cargs-and-largs-makefile.patch')
sha1sums=('408ec35c3bb86bd227db3da55d3e1e0c572a56e3'
          '4aaab0df8b611750d2cb35973ed28823fb233989'
          'db88bcb65d1a5f41c5b30e0c3dea996c47c4f5b9')

prepare() {
    cd "$srcdir/gprbuild-$_upstream_ver-src"
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
    cd "$srcdir/gprbuild-$_upstream_ver-src"
    for k in static static-pic shared
    do
        make prefix=/usr PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R \
            libgpr.build.$k
    done
}

package() {
    cd "$srcdir/gprbuild-$_upstream_ver-src"

    for k in static static-pic shared
    do
        make prefix="$pkgdir/usr" PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R \
            libgpr.install.$k
    done
}
