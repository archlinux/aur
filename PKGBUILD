pkgname=aocl-libflame
pkgver=4.2
pkgrel=1
pkgdesc="High-performance object-based library for DLA computations, AOCL branding"
arch=('x86_64')
url="https://github.com/amd/libflame"
license=('custom')
depends=('gcc-libs' 'aocl-utils' 'aocl-blis')
makedepends=('gcc-fortran' 'python' 'cmake')
provides=('lapack' 'lapacke')
conflicts=('lapack' 'lapacke')
_lapackver=3
source=("$pkgname-$pkgver.tar.gz::https://github.com/amd/libflame/archive/$pkgver.tar.gz")
sha256sums=('93a433c169528ffba74a99df0ba3ce3d5b1fab9bf06ce8d2fd72ee84768ed84c')

build() {
    cd "$srcdir/libflame-$pkgver"
    CFLAGS=${CFLAGS/-march=x86-64/}
    CXXFLAGS=${CXXFLAGS/-march=x86-64/}
    AOCL_ROOT=/

    cmake -B newbuild \
        -DENABLE_AMD_FLAGS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_AOCL_BLAS=ON \
        -DLIBAOCLUTILS_INCLUDE_PATH=/usr/include/alci/ \
        -DLIBAOCLUTILS_LIBRARY_PATH=/usr/lib/libaoclutils.so

    cmake --build newbuild
}

package() {
    cd "$srcdir/libflame-$pkgver"
    DESTDIR="$pkgdir" cmake --install newbuild 

    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapack.so
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapack.so.3
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapacke.so
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapacke.so.3
}
