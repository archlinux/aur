# Maintainer: sparklespdx <josh.farwell@gmail.com>
pkgname="gpu_burn-git"
pkgver=0.9.35cfc40
pkgrel=1
pkgdesc="Multi-GPU CUDA stress test"
arch=('x86_64')
url="https://github.com/wilicc/gpu-burn"
license=('BSD')
makedepends=('git')
depends=('nvidia' 'opencl-nvidia' 'cuda')
source=("${pkgname}::git+https://github.com/wilicc/gpu-burn?ref=35cfc4045d8435ffac20035bab31e8c412aa1cb4")
sha256sums=('SKIP')

prepare () {
  sed -i "s|CUDAPATH=/usr/local/cuda|CUDAPATH=/opt/cuda|g" "$pkgname"/Makefile

  # Hax to make the program pick up compare.ptx in /usr/lib
  sed -i 's|const char \*kernelFile = "compare.ptx"|const char \*kernelFile = "/usr/lib/gpu_burn/compare.ptx"|g' "$pkgname"/gpu_burn-drv.cpp
}

build () {
  cd "$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 gpu_burn "${pkgdir}"/usr/bin/gpu_burn
  install -Dm644 compare.ptx "${pkgdir}"/usr/lib/gpu_burn/compare.ptx
}
