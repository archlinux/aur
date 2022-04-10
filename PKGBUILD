# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel at yahoo dot com>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname=rocm-llvm-mlir
pkgdesc="Radeon Open Compute - LLVM Multi-Level IR Compiler Framework"
pkgver=5.1
pkgrel=1
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/llvm-project-mlir"
license=('custom:Apache 2.0 with LLVM Exception')
depends=("rocm-llvm")
makedepends=("cmake" "sqlite")
source=("https://github.com/ROCmSoftwarePlatform/llvm-project-mlir/archive/release/rocm-5.1.tar.gz")
sha256sums=('7bc1eba4af74a4884efcf1cc73933efd7d8bc97445bf2a2e441d4db4ed624c4f')
_dirname="$(basename "$url")-release-$(basename "${source[0]}" .tar.gz)"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-4.5.x/docs/markdown/clang_options.md
  # -fPIC fixes linking.
  export CXXFLAGS="${CXXFLAGS} -fcf-protection=none -fPIC"

  cmake -S "$_dirname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DMLIR_MIOPEN_SQLITE_ENABLED=On \
    -DLLVM_TARGETS_TO_BUILD="X86;AMDGPU" \
    -DCMAKE_INSTALL_PREFIX='/opt/rocm' \
    -DBUILD_FAT_LIBMLIRMIOPEN=1

  make
}

package() {
  make DESTDIR="$pkgdir/" install

  cd "$_dirname"
  install -Dm644 mlir/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
