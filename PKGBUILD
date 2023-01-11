# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=xcfun-git
_pkgname=xcfun
pkgver=2.1.1.r1.gf87ca0e
pkgrel=4
pkgdesc="Exchange-Correlation functionals with arbitrary order derivatives"
arch=(i686 x86_64)
url="http://dftlibs.org/xcfun/"
license=('GPL3')
makedepends=(git cmake python)
provides=(xcfun xcfun-pyscf)
conflicts=(xcfun xcfun-pyscf)
source=($pkgname::git+https://github.com/dftlibs/xcfun.git)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=1 \
          -DXC_MAX_ORDER=3 -DXCFUN_ENABLE_TESTS=0 \
          -DXCFUN_PYTHON_INTERFACE=1 \
          -DCMAKE_INSTALL_PREFIX:PATH=/usr \
          ..
    make -j`getconf _NPROCESSORS_ONLN`
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir/" install
}
