pkgname=aocl-blis-aocc
pkgver=4.1
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software Framework, AOCL branding"
arch=('x86_64')
url="https://github.com/amd/blis"
license=('custom')
depends=('glibc' 'aocc')
provides=('blas' 'cblas' 'aocl-blis')
conflicts=('blas' 'cblas' 'aocl-blis')
makedepends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amd/blis/archive/$pkgver.tar.gz")
sha256sums=('a05c6c7d359232580d1d599696053ad0beeedf50f3b88d5d22ee7d34375ab577')

build() {
    cd $srcdir/blis-$pkgver
    CFLAGS=${CFLAGS/-fexceptions/}
    CXXFLAGS=${CXXFLAGS/-fexceptions/}
    CFLAGS=${CFLAGS/-march=x86-64/}
    CXXFLAGS=${CXXFLAGS/-march=x86-64/}
    CC=/opt/aocc/bin/clang CXX=/opt/aocc/bin/clang++ ./configure --prefix=/usr --enable-cblas --enable-threading=openmp amdzen
    make
}

package() {
    cd $srcdir/blis-$pkgver
    make DESTDIR=$pkgdir install
    ln -s /usr/lib/libblis-mt.so.4.1.0 $pkgdir/usr/lib/libblas.so
    ln -s /usr/lib/libblis-mt.so.4.1.0 $pkgdir/usr/lib/libblas.so.3
    ln -s /usr/lib/libblis-mt.so.4.1.0 $pkgdir/usr/lib/libcblas.so
    ln -s /usr/lib/libblis-mt.so.4.1.0 $pkgdir/usr/lib/libcblas.so.3
    ln -s /usr/share/pkgconfig/blis.pc $pkgdir/usr/share/pkgconfig/blas.pc
    ln -s /usr/share/pkgconfig/blis.pc $pkgdir/usr/share/pkgconfig/cblas.pc
}
