# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rocthrust
pkgver=4.3.0
pkgrel=1
pkgdesc='Port of the Thrust parallel algorithm library atop HIP/ROCm'
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/ROCm_Libraries/ROCm_Libraries.html#rocthrust'
license=('Apache')
depends=('hip-rocclr' 'rocprim')
makedepends=('cmake' 'git')
_git='https://github.com/ROCmSoftwarePlatform/rocThrust'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('a50eb6500687b4ea9e0b3affb1daff8bbc56199d39fbed3ee61d2d5bfc1a0271')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-4.3.x/docs/markdown/clang_options.md

  # With version 3.21, HIP support was added to CMake that breaks the current scripts, see
  # https://github.com/ROCmSoftwarePlatform/rocRAND/issues/198#issuecomment-893573440
  CXX=/opt/rocm/bin/hipcc \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -Wno-dev -S "$_dirname" \
        -D__skip_rocmclang=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        -DBUILD_TEST=OFF
}

package() {
  DESTDIR="$pkgdir" make install
}
