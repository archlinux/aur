# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rocalution
pkgver=4.2.0
pkgrel=1
pkgdesc='Next generation library for iterative sparse solvers for ROCm platform'
arch=('x86_64')
url='https://rocalution.readthedocs.io/en/master'
license=('MIT')
depends=('hip-rocclr' 'rocsparse' 'rocblas' 'rocprim' 'rocrand' 'openmp')
makedepends=('cmake' 'git')
_git='https://github.com/ROCmSoftwarePlatform/rocALUTION'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('0424adf522ded41de5b77666e04464a25c73c92e34025762f30837f90a797445')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
 # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-4.2.x/docs/markdown/clang_options.md
  CXX=/opt/rocm/bin/hipcc \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -B build -Wno-dev \
        -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DSUPPORT_HIP=ON \
        -DSUPPORT_OMP=ON \
        -DSUPPORT_MPI=OFF \
        -Dhip_DIR=/opt/rocm/hip/lib/cmake/hip \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/rocalution.conf" << EOF
/opt/rocm/rocalution/lib
EOF
  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
