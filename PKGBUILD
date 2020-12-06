# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=cosma
pkgver=2.3.0
pkgrel=1
pkgdesc="Distributed Communication-Optimal Matrix-Matrix Multiplication Algorithm"
arch=("x86_64")
url="https://github.com/eth-cscs/COSMA"
license=('BSD')
depends=('scalapack')
optdepends=('cuda: Fast linear algebra on GPU')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"$url/releases/download/v$pkgver/$pkgname.tar.gz"
        "scalar_matmul.patch")
sha256sums=('0c01c2deb5a0cd177952178350188a62c42ce55e604d7948ac472f55bf0d4815'
            '39cfd2219566f38915e8f984136ae9ae4daf725b3494738789e56596ecf9207c')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < ../scalar_matmul.patch
  mkdir -p ../build
  sed -i "/adjust_mpiexec_flags/d" CMakeLists.txt
  
  # Setting BLAS flavor
  if [ $( echo -n $( which nvcc ) | tail -c 4 ) == nvcc ]
  then
      export _BLAS=CUDA
      echo "GPU is enabled"
  else
      export _BLAS=CUSTOM
      echo "GPU is disabled"
  fi
}

build() {
  cd "$srcdir/build"
  cmake ../"$pkgname" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DBUILD_SHARED_LIBS=ON \
          -DCOSMA_BLAS=$_BLAS \
          -DCOSMA_SCALAPACK=CUSTOM \
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
