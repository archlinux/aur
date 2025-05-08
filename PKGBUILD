pkgname=aocl-blis
pkgver=5.1
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software Framework, AOCL branding"
arch=('x86_64')
url="https://github.com/amd/blis"
license=('custom')
depends=('gcc-libs')
provides=('blas' 'cblas')
conflicts=('blas' 'cblas')
_blasver=3
makedepends=('python' 'cmake' 'ninja')
_tag_str="AOCL-$pkgver-GA"
source=("$pkgname-$pkgver.tar.gz::https://github.com/amd/blis/archive/$_tag_str.tar.gz")
sha256sums=('de75e940d57fdcf3ed868c15774412cdfb7e92bebf60fb9e418f86d7dde6e923')


# Overriding -march with generic causes build issues
export CFLAGS=${CFLAGS/-march=x86-64/}
export CXXFLAGS=${CXXFLAGS/-march=x86-64/}

# gcc14 is required until upstream flame/blis#845 is resolved or patched
makedepends+=('gcc14' 'gcc14-fortran')
depends+=('gcc14-libs')
export FC=/usr/bin/gfortran-14
export CC=/usr/bin/gcc-14
export CXX=/usr/bin/g++-14

prepare() {
    cd $srcdir/blis-$_tag_str

    cmake . -G Ninja \
	    -DCMAKE_INSTALL_PREFIX=/usr \
	    -DBLIS_CONFIG_FAMILY=auto \
	    -DENABLE_BLAS=ON \
	    -DENABLE_CBLAS=ON \
	    -DENABLE_THREADING=openmp
}

build() {
    cd $srcdir/blis-$_tag_str
    cmake --build . --config Release
}

check() {
    cd $srcdir/blis-$_tag_str

    cmake --build . --config Release --target checkblis-fast

}

package() {
    cd $srcdir/blis-$_tag_str
    DESTDIR=$pkgdir ninja install
    ln -s /usr/lib/libblis-mt.so $pkgdir/usr/lib/libblas.so
    ln -s /usr/lib/libblis-mt.so $pkgdir/usr/lib/libblas.so.${_blasver}
    ln -s /usr/lib/libblis-mt.so $pkgdir/usr/lib/libcblas.so
    ln -s /usr/lib/libblis-mt.so $pkgdir/usr/lib/libcblas.so.${_blasver}
    ln -s /usr/lib/pkgconfig/blis.pc $pkgdir/usr/lib/pkgconfig/blas.pc
    ln -s /usr/lib/pkgconfig/blis.pc $pkgdir/usr/lib/pkgconfig/cblas.pc
}
