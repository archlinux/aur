# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel at yahoo dot com>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname=rocm-llvm-mlir
pkgdesc="Radeon Open Compute - LLVM Multi-Level IR Compiler Framework"
pkgver=5.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/rocMLIR"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('hip')
makedepends=('cmake' 'ninja' 'sqlite' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('3823f455ee392118c3281e27d45fa0e5381f3c4070eb4e06ba13bc6b34a90a60')
options=(!lto)
_dirname="$(basename $url)-$(basename ${source[0]} .tar.gz)"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://docs.amd.com/bundle/ROCm-Compiler-Reference-Guide-v5.4/page/Appendix_A.html
  # -fPIC fixes linking.
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none -fPIC" \
  cmake \
    -Wno-dev \
    -G Ninja \
    -B build \
    -S "$_dirname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DMLIR_MIOPEN_SQLITE_ENABLED=On \
    -DLLVM_TARGETS_TO_BUILD='X86;AMDGPU' \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm \
    -DBUILD_FAT_LIBMLIRMIOPEN=1
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$_dirname"
  install -Dm644 mlir/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
