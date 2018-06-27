# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>
pkgname=libgpr-git
pkgver=r3363.f169bdd6
pkgrel=1
pkgdesc="Ada library to handle GPRbuild project files"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3')
depends=('glibc' 'xmlada')
makedepends=('git' 'gprbuild-bootstrap-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/AdaCore/gprbuild.git'
        'expose-cargs-and-largs-makefile.patch')
sha1sums=('SKIP'
          'f8519098417f781273061169ff30cc16153d4dec')

pkgver() {
    cd "$srcdir/gprbuild"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/gprbuild"
    patch -Np1 -i "$srcdir/expose-cargs-and-largs-makefile.patch"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr \
        share/gprconfig/compilers.xml \
        share/gprconfig/linker.xml \
        share/gprconfig/gnat.xml
}

build() {
    cd "$srcdir/gprbuild"
    for k in static static-pic shared
    do
        make prefix=/usr PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R \
            libgpr.build.$k
    done
}

package() {
    cd "$srcdir/gprbuild"

    for k in static static-pic shared
    do
        make prefix="$pkgdir/usr" PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R \
            libgpr.install.$k
    done
}
