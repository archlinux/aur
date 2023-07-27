pkgname=aocl-libflame-aocc
pkgver=4.0
pkgrel=1
pkgdesc="High-performance object-based library for DLA computations, AOCL branding"
arch=('x86_64')
url="https://github.com/amd/libflame"
license=('custom')
depends=('glibc' 'aocc')
makedepends=('gcc-fortran' 'python')
provides=('lapack' 'lapacke')
conflicts=('lapack' 'lapacke')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amd/libflame/archive/$pkgver.tar.gz")
sha256sums=('bcb05763aa1df1e88f0da5e43ff86d956826cbea1d9c5ff591d78a3e091c66a4')

build() {
    cd $srcdir/libflame-$pkgver
    LDFLAGS=${LDFLAGS/,--as-needed/}
    CC=/opt/aocc/bin/clang CXX=/opt/aocc/bin/clang++ F77=/opt/aocc/bin/flang ./configure --prefix=/usr --enable-max-arg-list-hack --enable-dynamic-build --enable-lapack2flame --enable-multithreading=openmp --enable-amd-flags --enable-amd-aocc-flags --enable-vector-intrinsics=sse --enable-amd-opt
    make
}

package() {
    cd $srcdir/libflame-$pkgver
    make DESTDIR=$pkgdir install-libs install-lib-symlinks
    mkdir -p $pkgdir/usr/include
    install -m644 src/lapacke/LAPACKE/include/*.h $pkgdir/usr/include
    install -m644 src/base/flamec/include/FLAME.h $pkgdir/usr/include
    install -m644 src/src_cpp/*.hh $pkgdir/usr/include

    ln -s /usr/lib/libflame.so.4.0 $pkgdir/usr/lib/liblapack.so
    ln -s /usr/lib/libflame.so.4.0 $pkgdir/usr/lib/liblapack.so.3
    ln -s /usr/lib/libflame.so.4.0 $pkgdir/usr/lib/liblapacke.so
    ln -s /usr/lib/libflame.so.4.0 $pkgdir/usr/lib/liblapacke.so.3
}
