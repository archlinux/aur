# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocwmma
pkgver=6.3.2
pkgrel=1
pkgdesc='Library for accelerating mixed precision matrix multiplication'
arch=('x86_64')
url='https://rocwmma.readthedocs.io/en/latest/index.html'
license=('MIT')
depends=('hip' 'rocblas' 'openmp')
makedepends=('rocm-cmake' 'doxygen')
_git='https://github.com/ROCm/rocWMMA'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('f9dc5e837ac30efe4600775fb309e46ed8ef112a673435663d2ef7fdf28f8f12')
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

build() {
  CC=/opt/rocm/llvm/bin/amdclang CXX=/opt/rocm/llvm/bin/amdclang++ cmake \
      -Wno-dev \
      -B build \
      -S "$_dirname" \
      -DCMAKE_INSTALL_PREFIX=/opt/rocm \
      -DCMAKE_BUILD_TYPE=None \
      -DROCWMMA_BUILD_TESTS=OFF \
      -DROCWMMA_BUILD_SAMPLES=OFF
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
