# Maintainer: Jesse R Codling <codling at umich dot edu>

pkgname=aocl-libflame
pkgver=5.0
pkgrel=2
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
sha256sums=('3bee3712459a8c5bd728a521d8a4c8f46735730bf35d48c878d2fc45fc000918')

prepare() {
    cd "$srcdir/libflame-$pkgver"

    CFLAGS=${CFLAGS/-march=x86-64/}
    CXXFLAGS=${CXXFLAGS/-march=x86-64/}
    AOCL_ROOT=/

    cmake -B newbuild -G Ninja\
        -DENABLE_AMD_FLAGS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_AOCL_BLAS=ON \
        -DLIBAOCLUTILS_INCLUDE_PATH=/usr/include/alci/ \
        -DLIBAOCLUTILS_LIBRARY_PATH=/usr/lib/libaoclutils.so \
	# -DBUILD_TEST=ON \ # for testing only
	# -DCMAKE_EXT_BLAS_LIBRARY_DEPENDENCY_PATH=/usr/lib/ \
	# -DEXT_BLAS_LIBNAME=libblis-mt.so

}

build() {
    cd "$srcdir/libflame-$pkgver"
    CFLAGS=${CFLAGS/-march=x86-64/}
    CXXFLAGS=${CXXFLAGS/-march=x86-64/}
    AOCL_ROOT=/

    cmake --build newbuild
}

# check() { # testing this library takes an exorbitant amount of time
#     cd "$srcdir/libflame-$pkgver"
#     CFLAGS=${CFLAGS/-march=x86-64/}
#     CXXFLAGS=${CXXFLAGS/-march=x86-64/}
#     AOCL_ROOT=/
#
#     ctest --test-dir newbuild
# }

package() {
    cd "$srcdir/libflame-$pkgver"/newbuild
    DESTDIR="$pkgdir" ninja install

    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapack.so
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapack.so.3
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapacke.so
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapacke.so.3
}
