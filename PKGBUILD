# Maintainer: Wu Junyu (aka Tenshi65535) <wu.junyu.aur@outlook.com>
# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=libcint
pkgver=5.1.8
pkgrel=1
pkgdesc="General GTO integrals for quantum chemistry"
arch=(i686 x86_64)
url="https://github.com/sunqm/libcint"
license=('BSD')
depends=('blas')
makedepends=('cmake' 'gcc-fortran')
checkdepends=('python' 'python-numpy')
optdepends=('clisp: for common lisp scripts.')
provides=($pkgname=$pkgver)
source=($pkgname-$pkgver.tar.gz::https://github.com/sunqm/libcint/archive/v$pkgver.tar.gz)
sha256sums=(c729935c11acc6a3ad9acc199036f97c5fbd058f0b8dae2292f07ba643494f35)

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake -DWITH_F12=ON -DWITH_RANGE_COULOMB=1 -DWITH_COULOMB_ERF=1 \
          -DENABLE_EXAMPLE=1 -DENABLE_TEST=1 \
          -DCMAKE_INSTALL_LIBDIR:PATH="lib" \
          -DCMAKE_INSTALL_PREFIX:PATH="/usr" ..
    make
}

check() {
    cd "$pkgname-$pkgver/build"
    #ignore test2 to avoid dependency cycle
    make test ARGS="-I 1,1"
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
