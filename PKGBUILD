# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rocalution
pkgver=5.1.0
pkgrel=1
pkgdesc='Next generation library for iterative sparse solvers for ROCm platform'
arch=('x86_64')
url='https://rocalution.readthedocs.io/en/master'
license=('MIT')
depends=('hip' 'rocsparse' 'rocblas' 'rocprim' 'rocrand' 'openmp')
makedepends=('cmake' 'rocm-cmake' 'git')
_git='https://github.com/ROCmSoftwarePlatform/rocALUTION'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('d9122189103ebafe7ec5aeb50e60f3e02af5c2747021f9071aab91e7f875c29e')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/develop/docs/markdown/clang_options.md
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -B build \
        -S "$_dirname" \
        -DROCM_PATH=/opt/rocm \
        -DAMDGPU_TARGETS=${AMDGPU_TARGETS:-gfx803;gfx900:xnack-;gfx906:xnack-;gfx908:xnack-;gfx1030;gfx90a:xnack-;gfx90a:xnack+}
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/rocalution.conf" << EOF
/opt/rocm/rocalution/lib
EOF
  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
