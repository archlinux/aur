pkgname=aocl-libflame
pkgver=4.1
pkgrel=1
pkgdesc="High-performance object-based library for DLA computations, AOCL branding"
arch=('x86_64')
url="https://github.com/amd/libflame"
license=('custom')
depends=('gcc-libs')
makedepends=('gcc-fortran' 'python' 'aocl-utils')
provides=('lapack' 'lapacke')
conflicts=('lapack' 'lapacke')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amd/libflame/archive/$pkgver.tar.gz")
sha256sums=('8aed69c60d11cc17e058cabcb8a931cee4f343064ade3e73d3392b7214624b61')

build() {
    cd $srcdir/libflame-$pkgver
    CFLAGS=${CFLAGS/-march=x86-64/}
    CXXFLAGS=${CXXFLAGS/-march=x86-64/}
    ./configure --prefix=/usr --enable-max-arg-list-hack --enable-dynamic-build --enable-lapack2flame --enable-multithreading=openmp --enable-amd-flags
    make
}

package() {
    cd $srcdir/libflame-$pkgver
    make DESTDIR=$pkgdir install-libs install-lib-symlinks
    mkdir -p $pkgdir/usr/include
    install -m644 src/lapacke/LAPACKE/include/*.h $pkgdir/usr/include
    install -m644 src/base/flamec/include/FLAME.h $pkgdir/usr/include
    install -m644 src/src_cpp/*.hh $pkgdir/usr/include

    ln -s /usr/lib/libflame.so.4.1.0 $pkgdir/usr/lib/liblapack.so
    ln -s /usr/lib/libflame.so.4.1.0 $pkgdir/usr/lib/liblapack.so.3
    ln -s /usr/lib/libflame.so.4.1.0 $pkgdir/usr/lib/liblapacke.so
    ln -s /usr/lib/libflame.so.4.1.0 $pkgdir/usr/lib/liblapacke.so.3
}
