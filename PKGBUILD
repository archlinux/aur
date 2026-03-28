# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: iveahugeship <iveahugeship@gmail.com>
# Contributor: sparklespdx <josh.farwell@gmail.com>
pkgname=gpu-burn-git
pkgver=r90.671f4be
pkgrel=2
pkgdesc="Multi-GPU CUDA stress test"
arch=('x86_64')
url="https://github.com/wilicc/gpu-burn"
license=('BSD-2-Clause')
makedepends=('git')
depends=(
  'cuda'
  'nvidia-utils'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gpu_burn-git')
source=('git+https://github.com/wilicc/gpu-burn.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare () {
  cd "${pkgname%-git}"

  # Set compare.ptx path
  sed -i "s|compare.ptx|/usr/share/${pkgname%-git}/compare.ptx|g" gpu_burn-drv.cpp
}

build () {
  cd "${pkgname%-git}"
  CUDAPATH=/opt/cuda make HOST_COMPILER="$NVCC_CCBIN"
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 gpu_burn -t "$pkgdir/usr/bin/"
  install -Dm644 compare.ptx -t "$pkgdir/usr/share/${pkgname%-git}/"
  install -Dm644 "${pkgname%-git}.8" -t "$pkgdir/usr/share/man/man8/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

