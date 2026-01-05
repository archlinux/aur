pkgname=aocl-blis
pkgver=5.2
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
sha256sums=('c553bd543eedc87920df9b82634ae4c02662145ed737f51fdf4c9bca5e588028')


# Overriding -march with generic causes build issues
export CFLAGS="${CFLAGS/-march=x86-64/}"
export CXXFLAGS="${CXXFLAGS/-march=x86-64/}"


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
