# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=barvinok
pkgver=0.41.8
pkgrel=1
pkgdesc='A library for counting the number of integer points in (non-)parametric polytopes'
arch=('x86_64')
url='https://repo.or.cz/barvinok.git'
license=('GPL-2.0-only')
depends=('ntl' 'libisl>0.19' 'polylib-gmp')
makedepends=('git')
source=("git+https://repo.or.cz/barvinok.git#tag=$pkgname-$pkgver")
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
    ./configure --prefix=/usr --enable-shared-barvinok --with-isl=system --with-polylib=system LIBS="-lpthread"
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
