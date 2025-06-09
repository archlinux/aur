# Maintainer: Chris Hillenbrand <chillenb.lists@gmail.com>
# Maintainer: Wu Junyu (aka Tenshi65535) <wu.junyu.aur@outlook.com>
# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=libcint
pkgver=6.1.2
pkgrel=3
pkgdesc="General GTO integrals for quantum chemistry"
arch=(i686 x86_64)
url="https://github.com/sunqm/libcint"
license=('Apache-2.0')
makedepends=('cmake' 'gcc-fortran')
checkdepends=('python' 'python-numpy')
optdepends=('clisp: for common lisp scripts.')
provides=($pkgname=$pkgver)
source=($pkgname-$pkgver.tar.gz::https://github.com/sunqm/libcint/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8287e1eaf2b8c8e19eb7a8ea92fd73898f0884023c503b84624610400adb25c4')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -S . \
          -DWITH_F12=ON -DWITH_RANGE_COULOMB=1 -DWITH_COULOMB_ERF=1 \
          -DENABLE_EXAMPLE=1 -DENABLE_TEST=1 \
          -DCMAKE_INSTALL_LIBDIR:PATH="lib" \
          -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
          -DCMAKE_C_STANDARD=99
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver"
    #ignore test2 to avoid dependency cycle
    ctest --test-dir build -I 1,1 --output-on-failure
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}
