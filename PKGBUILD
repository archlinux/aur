# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=libgpr
pkgver=2019
pkgrel=1
pkgdesc="Ada library to handle GPRbuild project files"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3')
depends=('xmlada')
makedepends=('gprbuild-bootstrap')
conflicts=("${pkgname}-git")


source=('http://mirrors.cdn.adacore.com/art/5cdf8e8031e87a8f1d425093'
        'relocatable-build.patch'
        'expose-cargs-and-largs-makefile.patch')
sha1sums=('0c03c05cef70b85144ba0e624a46e8952183b666'
          '4aaab0df8b611750d2cb35973ed28823fb233989'
          'db88bcb65d1a5f41c5b30e0c3dea996c47c4f5b9')

prepare() {
    cd "$srcdir/gprbuild-2019-20190517-194D8-src"
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
    cd "$srcdir/gprbuild-2019-20190517-194D8-src"
    for k in static static-pic shared
    do
        make prefix=/usr PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R \
            libgpr.build.$k
    done
}

package() {
    cd "$srcdir/gprbuild-2019-20190517-194D8-src"

    for k in static static-pic shared
    do
        make prefix="$pkgdir/usr" PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R \
            libgpr.install.$k
    done
}
