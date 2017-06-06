pkgname=gprbuild-bootstrap
#pkgver=r3147.g18e2bc01
pkgver=2017
pkgrel=1

pkgdesc='static gprbuild to bootstrap xmlada and gprbuild proper'
url='http://www.adacore.com/gnatpro/toolsuite/gprbuild/'
arch=('i686' 'x86_64')
license=('GPL')

options=('debug' '!strip')

depends=('glibc')
makedepends=('git' 'gcc-ada')

source=('git+https://github.com/AdaCore/gprbuild'
        'git+https://github.com/AdaCore/xmlada')

sha1sums=('SKIP' 'SKIP')

#pkgver() {
#    cd gprbuild
#    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare() {
    cd gprbuild

    # Not everyone is Debian.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr \
        share/gprconfig/compilers.xml \
        share/gprconfig/linker.xml \
        share/gprconfig/gnat.xml
}

build() {
    cd gprbuild
    export GNATMAKEFLAGS="-j$(nproc)"
    export DESTDIR="$srcdir"/bootstrap
    ./bootstrap.sh --prefix=/usr --libexecdir=/lib --with-xmlada="$srcdir"/xmlada
}

package() {
    cd bootstrap
    cp -a --no-preserve=ownership -- "$srcdir"/bootstrap/usr "$pkgdir"
}
