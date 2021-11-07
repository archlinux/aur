# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=spla
pkgver=1.5.2
pkgrel=1
pkgdesc="Specialized Parallel Linear Algebra"
arch=("x86_64")
url="https://github.com/eth-cscs/spla"
license=('BSD')
depends=('openmpi' 'cblas')
makedepends=('cmake' 'gcc-fortran')
optdepends=('cuda: GPU Backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('344c34986dfae182ec2e1eb539c9a57f75683aaa7a61a024fd0c594d81d97016')

prepare() {
  # Checking if nvcc is in PATH
  if command -v nvcc &> /dev/null
  then
      export _ACC=CUDA
      export LDFLAGS="$LDFLAGS -L/opt/cuda/lib64"
      echo "GPU is enabled"
  else
      export _ACC=OFF
      echo "GPU is disabled"
  fi
}

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake ../"$pkgname-$pkgver" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DSPLA_FORTRAN=ON \
          -DSPLA_HOST_BLAS=GENERIC \
          -DSPLA_GPU_BACKEND=$_ACC
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm755 ../$pkgname-$pkgver/LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
