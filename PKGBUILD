# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rocalution
pkgver=3.3.0
pkgrel=1
pkgdesc='Next generation library for iterative sparse solvers for ROCm platform'
arch=('x86_64')
url='https://rocalution.readthedocs.io/en/master'
license=('MIT')
depends=('hip-hcc' 'rocsparse' 'rocblas' 'rocprim' 'rocminfo' 'openmp')
makedepends=('cmake' 'hcc' 'git')
_git='https://github.com/ROCmSoftwarePlatform/rocALUTION'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('2745ad513ad90a7fb3d9182037ec499c3bbd19b6c928b5c24e777392b2c9bd2d')

build() {
  mkdir -p build
  cd build

  CXX=/opt/rocm/hcc/bin/hcc \
  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/rocalution \
        -DSUPPORT_HIP=ON \
        -DSUPPORT_OMP=ON \
        -DSUPPORT_MPI=OFF \
        -Dhip_DIR=/opt/rocm/hip/lib/cmake/hip \
        -Dhcc_DIR=/opt/rocm/hcc/lib/cmake/hcc \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        "$srcdir/rocALUTION-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/rocalution.conf" << EOF
/opt/rocm/rocalution/lib
EOF
  install -Dm644 "$srcdir/rocALUTION-rocm-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
