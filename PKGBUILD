# Maintainer: Jesse R Codling <codling at umich dot edu>

pkgname=aocl-libflame
pkgver=5.1
pkgrel=1
pkgdesc="High-performance object-based library for DLA computations, AOCL branding"
arch=('x86_64')
url="https://github.com/amd/libflame"
license=('custom')
depends=('gcc-libs' 'aocl-utils' 'aocl-blis')
makedepends=('gcc-fortran' 'python' 'cmake' 'ninja')
provides=('lapack' 'lapacke')
conflicts=('lapack' 'lapacke')
_lapackver=3
source=("$pkgname-$pkgver.tar.gz::https://github.com/amd/libflame/archive/$pkgver.tar.gz")
sha256sums=('25524ba78b5952303369fa0859d217e44071144fd122a9dc3f72ed0bd73e3b2d')

# specified generic -march causes build issues
export CFLAGS=${CFLAGS/-march=x86-64/}
export CXXFLAGS=${CXXFLAGS/-march=x86-64/}

# path needed to find pre-built AOCL-BLIS
export AOCL_ROOT=/usr/

prepare() {
    cd "$srcdir/libflame-$pkgver"


    cmake -B newbuild -G Ninja\
        -DENABLE_AMD_FLAGS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_AOCL_BLAS=ON \
        -DLIBAOCLUTILS_INCLUDE_PATH=/usr/include/alci/ \
        -DLIBAOCLUTILS_LIBRARY_PATH=/usr/lib/libaoclutils.so \
	# -DBUILD_TEST=ON \
	# -DCMAKE_EXT_BLAS_LIBRARY_DEPENDENCY_PATH=/usr/lib/ \
	# -DEXT_BLAS_LIBNAME=libblis-mt.so
	# last 3 are only for testing, which is extremely slow

}

build() {
    cd "$srcdir/libflame-$pkgver"

    cmake --build newbuild
}

# check() { # testing this library takes an exorbitant amount of time
#     cd "$srcdir/libflame-$pkgver"
#
#     ctest --test-dir newbuild
# }

package() {
    cd "$srcdir/libflame-$pkgver"/newbuild
    DESTDIR="$pkgdir" ninja install

    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapack.so
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapack.so.${_lapackver}
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapacke.so
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapacke.so.${_lapackver}
    ln -s /usr/lib/pkgconfig/flame.pc ${pkgdir}/usr/lib/lapack.pc
    ln -s /usr/lib/pkgconfig/flame.pc ${pkgdir}/usr/lib/lapacke.pc
}
