# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=sirius
_PkgName=SIRIUS
pkgver=7.11.1
pkgrel=1
pkgdesc="Domain specific library for electronic structure calculations"
arch=(x86_64 aarch64)
license=(BSD-3-Clause)
url="https://github.com/electronic-structure/SIRIUS"
depends=(libvdwxc libxc spglib elpa spfft spla gsl hdf5 costa fmt
         scalapack openmpi blas python)
makedepends=(cmake ninja gcc-fortran eigen)
optdepends=('magma: Linear algebra on GPU')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce77dd168b2c3ef4a89cc2d6b163cb00b3d8b9d4b0652bc9de187dc7e0e74d77')
options=(!emptydirs)

prepare() {
  if command -v nvcc &> /dev/null; then
    _ACC=ON
    export LDFLAGS="$LDFLAGS -L/opt/cuda/lib64"
    echo "GPU is enabled"
  else
    _ACC=OFF
    echo "GPU is disabled"
  fi
}

build() {
  cmake \
    -B build \
    -S $_PkgName-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
    -D SIRIUS_CREATE_FORTRAN_BINDINGS=ON \
    -D SIRIUS_USE_OPENMP=ON \
    -D SIRIUS_USE_SCALAPACK=ON \
    -D SIRIUS_USE_VDWXC=ON \
    -D SIRIUS_USE_ELPA=ON \
    -D SIRIUS_USE_MEMORY_POOL=OFF \
    -D SIRIUS_USE_CUDA=$_ACC \
    -D SIRIUS_USE_MAGMA=$_ACC \
    -D BUILD_TESTING=ON \
    -G Ninja \
    -W no-dev
  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure -E sirius.scf
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_PkgName-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/usr/bin/atom" "$pkgdir/usr/bin/sirius_atom"
  rm -f "$pkgdir"/usr/bin/test_* "$pkgdir/usr/bin/read_atom" "$pkgdir/usr/bin/unit_tests.x"
}
