pkgname=aocl-blis
pkgver=4.2
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software Framework, AOCL branding"
arch=('x86_64')
url="https://github.com/amd/blis"
license=('custom')
depends=('gcc-libs')
provides=('blas' 'cblas')
conflicts=('blas' 'cblas')
_blasver=3
makedepends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amd/blis/archive/$pkgver.tar.gz")
sha256sums=('0e1baf850ba0e6f99e79f64bbb0a59fcb838ddb5028e24527f52b407c3c62963')

build() {
    cd $srcdir/blis-$pkgver
    CFLAGS=${CFLAGS/-march=x86-64/}
    CXXFLAGS=${CXXFLAGS/-march=x86-64/}

    ./configure --prefix=/usr --enable-cblas --enable-threading=openmp auto
    make
}

package() {
    cd $srcdir/blis-$pkgver
    make DESTDIR=$pkgdir install
    ln -s /usr/lib/libblis-mt.so $pkgdir/usr/lib/libblas.so
    ln -s /usr/lib/libblis-mt.so $pkgdir/usr/lib/libblas.so.${_blasver}
    ln -s /usr/lib/libblis-mt.so $pkgdir/usr/lib/libcblas.so
    ln -s /usr/lib/libblis-mt.so $pkgdir/usr/lib/libcblas.so.${_blasver}
    ln -s /usr/share/pkgconfig/blis.pc $pkgdir/usr/share/pkgconfig/blas.pc
    ln -s /usr/share/pkgconfig/blis.pc $pkgdir/usr/share/pkgconfig/cblas.pc
}
