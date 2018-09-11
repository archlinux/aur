# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild
pkgver=2018
pkgrel=2
pkgdesc="Builder for multi-language systems"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3')
depends=('libgpr>=2018')
makedepends=('gprbuild-bootstrap>=2018')

# Provides gprbuild-bootstrap to satisfy xmlada & libgpr needs, if they are rebuilt.
provides=("gprbuild-bootstrap=2018")
conflicts=("gprbuild-bootstrap-git" "gprbuild-git")

source=('http://mirrors.cdn.adacore.com/art/5b0819dfc7a447df26c27a68'
        'relocatable-build.patch'
        'expose-cargs-and-largs-makefile.patch')
sha1sums=('f2cfc62fc05ae510e7e3aa7138d27ccb38096bdd'
          '4aaab0df8b611750d2cb35973ed28823fb233989'
          'db88bcb65d1a5f41c5b30e0c3dea996c47c4f5b9')

# Remove '-fvar-tracking-assignments' from DEBUG_CFLAGS since clang does not understand it.
DEBUG_CFLAGS="-g"

prepare() {
    cd "$srcdir/gprbuild-gpl-2018-src"

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
    cd "$srcdir/gprbuild-gpl-2018-src"

    # Make using a single job (-j1) to avoid the same file being compiled at the same time.
    make -j1 prefix=/usr BUILD=production setup
    make -j1 GPRBUILD_OPTIONS=-R BUILD=production
}

package() {
    cd "$srcdir/gprbuild-gpl-2018-src"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1  BUILD=production

    # We don't need to distribute the installation script
    rm -f -- "$pkgdir/usr/doinstall"
}
