# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: iveahugeship <iveahugeship@gmail.com>
# Contributor: sparklespdx <josh.farwell@gmail.com>

# Desktop GPU arches only, specify your own if needed
CUDA_ARCH=(75 86 89 120)

_pkgname=gpu-burn
pkgname=gpu-burn-git
pkgver=r102.3ead140
pkgrel=1
pkgdesc="Multi-GPU CUDA stress test"
arch=('x86_64')
url="https://github.com/wilicc/gpu-burn"
license=('BSD-2-Clause')
makedepends=('git')
depends=(
  'cuda'
)
optdepends+=(
  'nvidia-utils: built-in monitoring for NVIDIA GPUs'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gpu_burn-git')
_srcname=gpu-burn
source=('git+https://github.com/wilicc/gpu-burn.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd "$_srcname"

  # Patch in the absolute path to the compiled CUDA kernel
  sed -E \
    -e "/#define COMPARE_KERNEL/ s|\"(.+)\"|\"/usr/lib/$_pkgname/\\1\"|" \
    -i gpu_burn-drv.cpp
}

build () {
  cd "$_srcname"

  declare -a _nvcc_flags
  for a in "${CUDA_ARCH[@]}"; do
    _nvcc_flags+=(
      "-gencode=arch=compute_$a,code=[compute_$a,sm_$a]"
    )
  done

  append_path() { PATH="$PATH:$1"; }
  source /etc/profile.d/cuda.sh

  make \
    CUDAPATH="$CUDA_PATH" HOST_COMPILER="$NVCC_CCBIN" \
    COMPUTE= NVCCFLAGS="${_nvcc_flags[*]}" \
    # EOL
}

package() {
  cd "$_srcname"

  install -Dm755 gpu_burn -t "$pkgdir/usr/bin"
  install -Dm644 compare.fatbin -t "$pkgdir/usr/lib/$_pkgname"
  install -Dm644 "$_pkgname.8" -t "$pkgdir/usr/share/man/man8"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

