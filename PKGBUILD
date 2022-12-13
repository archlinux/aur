# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: Markus Näther <naether.markus@gmail.com>
pkgname=hipblas
pkgver=5.4.0
pkgrel=1
pkgdesc='ROCm BLAS marshalling library'
arch=('x86_64')
url='https://hipblas.readthedocs.io/en/latest/'
license=('MIT')
depends=('hip' 'rocblas' 'rocsolver')
makedepends=('rocm-cmake' 'gcc-fortran')
_git='https://github.com/ROCmSoftwarePlatform/hipBLAS'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('341d61adff8d08cbf70aa07bd11a088bcd0687fc6156870a1aee9eff74f3eb4f')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://docs.amd.com/bundle/ROCm-Compiler-Reference-Guide-v5.4/page/Appendix_A.html
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake \
    -Wno-dev \
    -B build \
    -S "$_dirname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  echo "/opt/rocm/$pkgname/lib" > "$pkgname.conf"
  install -Dm644 "$pkgname.conf" "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
