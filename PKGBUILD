# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=cosma
pkgver=2.2.0
pkgrel=1
pkgdesc="Distributed Communication-Optimal Matrix-Matrix Multiplication Algorithm"
arch=("x86_64")
url="https://github.com/eth-cscs/COSMA"
license=('BSD')
depends=('scalapack' 'openblas')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"https://github.com/eth-cscs/COSMA/releases/download/v$pkgver/$pkgname.tar.gz")
sha256sums=('1eb92a98110df595070a12193b9221eecf9d103ced8836c960f6c79a2bd553ca')

prepare() {
  cd "$srcdir/$pkgname"
  mkdir ../build
  sed -i "/adjust_mpiexec_flags/d" CMakeLists.txt
}

build() {
  cd "$srcdir/build"
  cmake ../"$pkgname" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCOSMA_BLAS=OPENBLAS \
          -DCOSMA_SCALAPACK=CUSTOM \
          -DBUILD_SHARED_LIBS=ON \
          -DMPIEXEC_PREFLAGS='--oversubscribe'
  make
}

check() {
  cd "$srcdir/build"
  make test
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 "$srcdir/$pkgname/LICENCE" "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf "$pkgdir/usr/bin"
}
