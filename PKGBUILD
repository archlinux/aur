pkgname=gprbuild
#pkgver=r3147.g18e2bc01
pkgver=2017
pkgrel=1

pkgdesc='multi-language build system'
url='http://www.adacore.com/gnatpro/toolsuite/gprbuild/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('xmlada')
makedepends=('git' 'gprbuild-bootstrap')

# We provide gprbuild-bootstrap here so we can use this gprbuild to bootstrap
# itself and ada-xmlada.
provides=('gprbuild' 'gprbuild-bootstrap')
conflicts=('gprbuild' 'gprbuild-bootstrap')

source=('git+https://github.com/AdaCore/gprbuild'
        'expose-cargs-and-largs-makefile.patch')

sha1sums=('SKIP'
          'bda77367bc6985c3daf96929cccf5551a0544237')

#pkgver() {
#    cd gprbuild
#    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare() {
    cd gprbuild
    patch -Np1 -i "$srcdir"/expose-cargs-and-largs-makefile.patch

    # Not everyone is Debian
    sed -i 's/libexec/lib/g' bootstrap.sh doinstall gprbuild.gpr \
        share/gprconfig/compilers.xml \
        share/gprconfig/linker.xml \
        share/gprconfig/gnat.xml
}

build() {
    cd gprbuild
#    export OS=UNIX
#    make prefix=/usr  PROCESSORS="$(nproc)" setup
    make prefix=/usr setup
    make all
#    make GPRBUILD_OPTIONS=-R
}

package() {
    cd gprbuild
#    export OS=UNIX
    make prefix="$pkgdir"/usr install

    # Cleanup
    rm -f -- "$pkgdir"/usr/doinstall
}
