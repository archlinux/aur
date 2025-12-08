# Maintainer: Tianhao Wang <i AT shrik3 DOT com>
#
pkgname=vodozemac-bindings-cpp-kazv
pkgver=0.2.1
pkgrel=1
pkgdesc="kazv's C++ bindings for the vodozemac cryptographic library."
arch=('x86_64')
url="https://lily-is.land/kazv/vodozemac-bindings"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'perl' 'git')
source=("git+https://r.lily-is.land/the-kazv-project/vodozemac-bindings.git")
sha512sums=('SKIP')
provides=('libvodozemac.so')
_pkgname=vodozemac-bindings

prepare() {
    cd "$srcdir"/$_pkgname
    git checkout v$pkgver
    # generate lib.rs, so that we can run cargo fetch in the prepare()
    make -C cpp src/lib.rs
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir"/$_pkgname
    make -C cpp
}

package() {
    cd "$srcdir"/$_pkgname
    make -C cpp PREFIX="$pkgdir/usr" install
}
