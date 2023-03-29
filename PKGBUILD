# Maintainer: iveahugeship <iveahugeship@gmail.com>
# Contributor: sparklespdx <josh.farwell@gmail.com>

pkgname="gpu-burn-git"
pkgver=r76.5f0a86c
pkgrel=1
pkgdesc="Multi-GPU CUDA stress test"
arch=("x86_64")
url="https://github.com/wilicc/gpu-burn"
license=("BSD")
makedepends=("git")
depends=("nvidia-utils" "cuda")
provides=("gpu-burn")
conflicts=("gpu_burn-git" "gpu-burn")
replaces=("gpu_burn-git")
source=("${pkgname}::git+https://github.com/wilicc/gpu-burn.git")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare () {
  sed -i "s|/usr/local/cuda|/opt/cuda|g" "${pkgname}"/Makefile

  # Hax to make the program pick up compare.ptx in /usr/lib
  sed -i 's|"compare.ptx"|"/usr/lib/gpu_burn/compare.ptx"|g' "${pkgname}"/gpu_burn-drv.cpp
}

build () {
  cd "${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 gpu_burn "${pkgdir}"/usr/bin/gpu_burn
  install -Dm644 compare.ptx "${pkgdir}"/usr/lib/gpu_burn/compare.ptx
}

