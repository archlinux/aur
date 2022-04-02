# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=spla
pkgver=1.5.4
pkgrel=1
pkgdesc="Specialized Parallel Linear Algebra"
arch=("x86_64")
url="https://github.com/eth-cscs/spla"
license=('BSD')
depends=('openmpi' 'cblas')
makedepends=('cmake' 'gcc-fortran')
optdepends=('cuda: GPU Backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de30e427d24c741e2e4fcae3d7668162056ac2574afed6522c0bb49d6f1d0f79')

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
