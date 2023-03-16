# Maintainer: Alonso Rodriguez <alonso.rodriguez (at) udc.es>
# Thanks to barvinok's maintainer for the PKGBUILD template

pkgname=pet
pkgver=0.11.6
pkgrel=1
pkgdesc='Tool to extract a polyhedral model from C source using LLVM/clang to parse C code and isl to represent sets and relations.'
arch=(any)
url='https://repo.or.cz/pet.git'
license=('Copyright Leiden University & Ecole Normale Superieure')
depends=('libisl>0.19' 'polylib-gmp' 'libyaml')
makedepends=('git' 'llvm' 'pkgconf')
source=("git+https://repo.or.cz/pet.git#tag=$pkgname-$pkgver")
sha256sums=('SKIP')

prepare () {
    cd "$srcdir/$pkgname"

    # setup the repo
    ./get_submodules.sh
    ./autogen.sh
}

build() {
    cd "$srcdir/$pkgname"

    # NTL 11 now uses pthread functions, so we need to have it link to libpthread.
    ./configure --prefix=/usr --enable-shared-pet --with-isl=system --with-polylib=system LIBS="-lpthread"
    make
}

check() {
    cd "$srcdir/$pkgname"
    make check
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
