# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=xcfun
pkgver=2.1.1
pkgrel=1
pkgdesc="Exchange-Correlation functionals with arbitrary order derivatives"
arch=(x86_64)
url="http://dftlibs.org/xcfun/"
license=('MPL2.0')
depends=(gcc-fortran python pybind11 python-numpy)
checkdepends=(python-pytest)
makedepends=(cmake)
provides=(xcfun)
conflicts=(xcfun-pyscf)
source=($pkgname-$pkgver::https://github.com/dftlibs/xcfun/archive/v$pkgver.tar.gz)
sha256sums=('8b602df74c7be83d501532565deafd1b7881946d94789122f24c309a669298ab')

build() {
    cd $pkgname-$pkgver
    cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DXCFUN_PYTHON_INTERFACE=ON
    cmake --build build -j`getconf _NPROCESSORS_ONLN`
    # cd build
    # cmake -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=1 \
    #       -DXC_MAX_ORDER=3 -DXCFUN_ENABLE_TESTS=0 \
    #       -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    #       ..
    # make
}

check(){
    cd $pkgname-$pkgver
    ctest --test-dir build -j`getconf _NPROCESSORS_ONLN`
}

package() {
    cd $pkgname-$pkgver
    cmake --install build --prefix $pkgdir/usr/
    # make DESTDIR="$pkgdir/" install
}
