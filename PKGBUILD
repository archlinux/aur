# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild
pkgver=2019
pkgrel=1
pkgdesc="Builder for multi-language systems"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3')
depends=('libgpr')
makedepends=('gprbuild-bootstrap')
provides=("gprbuild-bootstrap")
conflicts=("gprbuild-bootstrap" "gprbuild-bootstrap-git" "gprbuild-git")

source=('http://mirrors.cdn.adacore.com/art/5cdf8e8031e87a8f1d425093'
        'relocatable-build.patch'
        'expose-cargs-and-largs-makefile.patch')
sha1sums=('0c03c05cef70b85144ba0e624a46e8952183b666'
          '4aaab0df8b611750d2cb35973ed28823fb233989'
          'db88bcb65d1a5f41c5b30e0c3dea996c47c4f5b9')

# Remove '-fvar-tracking-assignments' from DEBUG_CFLAGS since clang does not understand it.
DEBUG_CFLAGS="-g"

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

    # Make using a single job (-j1) to avoid the same file being compiled at the same time.
    make -j1 prefix=/usr BUILD=production setup
    make -j1 GPRBUILD_OPTIONS=-R BUILD=production
}

package() {
    cd "$srcdir/gprbuild-2019-20190517-194D8-src"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1  BUILD=production

    # We don't need to distribute the installation script
    rm -f -- "$pkgdir/usr/doinstall"
}
