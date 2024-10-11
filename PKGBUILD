pkgname=aocl-blis
pkgver=5.0
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
sha256sums=('5abb34972b88b2839709d0af8785662bc651c7806ccfa41d386d93c900169bc2')

prepare() {
    cd $srcdir/blis-$pkgver
    CFLAGS=${CFLAGS/-march=x86-64/}
    CXXFLAGS=${CXXFLAGS/-march=x86-64/}

    ./configure --prefix=/usr --enable-cblas --enable-threading=openmp auto
}

build() {
    cd $srcdir/blis-$pkgver
    CFLAGS=${CFLAGS/-march=x86-64/}
    CXXFLAGS=${CXXFLAGS/-march=x86-64/}
    make libs
}

# check() {
#     cd $srcdir/blis-$pkgver
#     CFLAGS=${CFLAGS/-march=x86-64/}
#     CXXFLAGS=${CXXFLAGS/-march=x86-64/}
#
#     make check
#     make cleantest
#
# }

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
