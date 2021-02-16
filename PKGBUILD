# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=libcint-git
_pkgname=libcint
pkgver=4.0.7.r2.ge0cc399
pkgrel=2
pkgdesc="General GTO integrals for quantum chemistry"
arch=(i686 x86_64)
url="http://wiki.sunqm.net/libcint"
license=('BSD')
depends=('blas')
makedepends=('cmake' 'git')
provides=(libcint)
conflicts=(libcint-cint3 libcint)
source=("$pkgname::git+https://github.com/sunqm/libcint.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake -DWITH_F12=ON -DWITH_RANGE_COULOMB=1 -DWITH_COULOMB_ERF=1 \
          -DCMAKE_INSTALL_LIBDIR:PATH="lib" \
          -DCMAKE_INSTALL_PREFIX:PATH="/usr" ..
    make -j`getconf _NPROCESSORS_ONLN`
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir/" install
}

