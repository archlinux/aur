# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=libplasma
_pkgname=plasma
pkgver=19.8.1
pkgrel=1
pkgdesc="Parallel Linear Algebra Software for Multicore Architectures"
arch=("x86_64")
url="https://bitbucket.org/icl/$_pkgname"
license=('BSD')
depends=('cblas' 'lapacke' 'gcc-libs')
makedepends=('cmake')
source=("$url/downloads/$_pkgname-$pkgver.tar.gz")
sha256sums=('3a5db6eabf91aec782b7f27b17a7f6b8ce2c9d8e648c0e9c0ff5d87277ba4d17')

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake ../$_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCBLAS_PROVIDER="netlib" \
        -DCBLAS_LIBRARIES="-lcblas" \
        -DNetlibCblas_INCLUDE_DIRS="/usr/include" \
        -DLAPACKE_PROVIDER="netlib" \
        -DLAPACKE_LIBRARIES="-llapacke" \
        -DLAPACKE_INCLUDE_DIRS="/usr/include"
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver/test"
  for f in test_*.c
  do
    export RTN=$( echo $f | sed "s/test_//g" | awk -F'.' '{print $1}' )
    echo "Testing routine $RTN"
    ../../build/plasmatest $( echo $RTN )
  done
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 ../$_pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
