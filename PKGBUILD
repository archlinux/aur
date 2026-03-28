pkgname=aocl-blis
pkgver=5.2.2
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software Framework, AOCL branding"
arch=('x86_64')
url="https://github.com/amd/blis"
license=('custom')
depends=('gcc-libs')
provides=('blas' 'cblas')
conflicts=('blas' 'cblas')
_blasver=3
makedepends=('python' 'cmake' 'ninja' 'gcc-fortran')
_tag_str="$pkgver"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$_tag_str.tar.gz")
sha256sums=('79f85665b2cdb10cd69d2418cc2dccaf8833adf20cf39d28b7fad544c58d3d80')


# Overriding -march with generic causes build issues
export CFLAGS="${CFLAGS/-march=x86-64/}"
export CXXFLAGS="${CXXFLAGS/-march=x86-64/}"

prepare() {
    cd $srcdir/blis-$_tag_str

    # remove _FORTIFY_SOURCE flag which conflicts with Arch's
    sed -i 's/"-D_FORTIFY_SOURCE=.\+" //' -s CMakeLists.txt

    cmake . -G Ninja \
	    -DCMAKE_INSTALL_PREFIX=/usr \
	    -DENABLE_BLAS=ON \
	    -DENABLE_CBLAS=ON \
	    -DENABLE_THREADING=openmp \
	    -DBLIS_CONFIG_FAMILY=amdzen
	    # this enables dynamic dispatch, required for also building aocl-libflame
}

build() {
    cd $srcdir/blis-$_tag_str
    cmake --build . --config Release
}

check() {
    cd $srcdir/blis-$_tag_str


    DISTPATH="$CWD"
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
