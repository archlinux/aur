# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>
pkgname=gprbuild-git
pkgver=r3152.ba7dba01
pkgrel=1
pkgdesc="Build system for multi-language systems"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3')
depends=('libgpr')
makedepends=('git' 'gprbuild-bootstrap-git' 'libgpr')

# gprbuild-bootstrap is here only to bootstrap gprbuild and xmlada
provides=("${pkgname%-git}" "gprbuild-bootstrap-git")
conflicts=("${pkgname%-git}" "gprbuild-bootstrap-git")
source=('git+https://github.com/AdaCore/gprbuild.git'
        'relocatable-build.patch'
        'expose-cargs-and-largs-makefile.patch')
sha1sums=('SKIP'
          '4aaab0df8b611750d2cb35973ed28823fb233989'
          'db88bcb65d1a5f41c5b30e0c3dea996c47c4f5b9')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
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
    cd "$srcdir/${pkgname%-git}"
    make prefix=/usr PROCESSORS="$(nproc)" setup
    make GPRBUILD_OPTIONS=-R
}

package() {
    cd "$srcdir/${pkgname%-git}"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1

    # We don't need to distribute the installation script
    rm -f -- "$pkgdir/usr/doinstall"
}
