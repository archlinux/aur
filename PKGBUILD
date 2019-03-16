# Maintainer: Ossi Saukko <osaukko at gmail dot com>

_name=valgrind
pkgname=valgrind-git
pkgver=VALGRIND_3_14_0.r124.g7e9113cb7
pkgrel=1
pkgdesc='A tool to help find memory-management problems in programs'
arch=('i686' 'x86_64')
url='http://valgrind.org/'
license=('GPL')
depends=('glibc' 'perl')
makedepends=('gdb' 'openmpi' 'git')
optdepends=('openmpi: MPI support')
options=(!emptydirs)
provides=("${_name}=${pkgver}")
conflicts=("${_name}")
source=("${_name}::git://sourceware.org/git/valgrind.git" "libmpiwrap.patch")
md5sums=('SKIP'
         'd57c9ff520e65909f701528dd3e37d80')

pkgver() {
    cd "${srcdir}/${_name}"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${srcdir}"
    patch --forward --strip=1 --input="libmpiwrap.patch"
}

build() {
    # valgrind does not like stack protector flags
    CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}
    CFLAGS=${CFLAGS/-fstack-protector-strong/}
    CXXFLAGS=${CXXFLAGS/-fstack-protector-strong/}

    cd "${srcdir}/${_name}"
    ./autogen.sh
    ./configure --prefix=/usr --mandir=/usr/share/man --with-mpicc=mpicc
    make
}

package() {
    cd "${srcdir}/${_name}"
    make DESTDIR="${pkgdir}" install
}

