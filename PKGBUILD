# Maintainer: BlightedDespot <esflanagin@gmail.com>
# ROCm/HIP port of wilicc/gpu-burn for AMD GPUs.
pkgname=gpu-burn-rocm
pkgver=1.1
pkgrel=1
pkgdesc="Multi-GPU stress test (ROCm/HIP port of gpu-burn) for AMD GPUs"
arch=('x86_64')
url="https://github.com/wilicc/gpu-burn"
license=('BSD-2-Clause')
depends=('hipblas' 'rocm-language-runtime')
makedepends=('rocm-hip-sdk' 'git')
_commit=3ead140434da9473582b68452f7115967a7a0581
source=("gpu-burn::git+https://github.com/wilicc/gpu-burn.git#commit=$_commit"
        "rocm-port.patch"
        "Makefile.rocm")
sha256sums=('SKIP'
            '12d9b9bf8b5d33dc5b2e152110daab3199f5b802e94eed7d2f676bdf6b56cbbc'
            '1b916228b4ee1d92a8da08182d9ce6937a074c93a2411ab94a2bddca7b7183d5')

prepare() {
  cd gpu-burn
  patch -Np1 < "$srcdir/rocm-port.patch"
  cp "$srcdir/Makefile.rocm" .
  # installed binary loads the code object from an absolute path
  sed -i 's|#define COMPARE_KERNEL "compare.code"|#define COMPARE_KERNEL "/usr/share/gpu-burn-rocm/compare.code"|' gpu_burn-drv.cpp
}

build() {
  cd gpu-burn
  make -f Makefile.rocm
}

package() {
  cd gpu-burn
  install -Dm755 gpu_burn "$pkgdir/usr/bin/gpu-burn-rocm"
  install -Dm644 compare.code "$pkgdir/usr/share/gpu-burn-rocm/compare.code"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
