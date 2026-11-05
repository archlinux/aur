# Maintainer: Christian Hammacher <chr.hammacher@gmail.com>
# Based on the extra/llama-cpp PKGBUILD by Sven-Hendrik Haase and Maxime Gauduin

pkgname=kvmem-cuda-git
pkgver=0.19.1.r67.ga2d8d9b
pkgrel=1
pkgdesc='llama.cpp server with KVMem long-context KV memory management (CUDA)'
arch=(x86_64)
url=https://github.com/kvmem/kvmem
license=(
  MIT
  LicenseRef-unknown
)
depends=(
  cuda
  glibc
  libgcc
  libstdc++
  nvidia-utils
  openssl
)
makedepends=(
  chrpath
  cmake
  git
  ninja
  python
)
provides=(kvmem)
conflicts=(kvmem)
options=(
  !buildflags
  !debug
)
source=(git+https://github.com/kvmem/kvmem.git
        git+https://github.com/ggml-org/llama.cpp.git)
b2sums=('SKIP'
        'SKIP')

# The adapter patches llama.cpp's bundled ggml, so neither system ggml nor
# llama-cpp can be used; the private libraries live in /usr/lib/kvmem instead

# RTX 20/30/40/50, the cards KVMem qualifies; set CUDA_ARCHITECTURES to build for one card only
_cuda_arch=${CUDA_ARCHITECTURES:-75-real;86-real;89-real;120a-real}

pkgver() {
  cd kvmem
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd kvmem
  git submodule init backends/llamacpp
  git config submodule.llamacpp.url "${srcdir}"/llama.cpp
  git -c protocol.file.allow=always submodule update --no-recommend-shallow backends/llamacpp
  python scripts/prepare-backends.py --backend llamacpp
}

build() {
  cmake -S kvmem -B build -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc \
      -DCMAKE_CUDA_ARCHITECTURES="${_cuda_arch}" \
      -DGGML_NATIVE=OFF \
      -DGGML_CUDA=ON \
      -DGGML_CUDA_FA_QUANTS=all \
      -DKVMEM_BUILD_LLAMA=ON \
      -DKVMEM_BUILD_SERVER_TESTS=OFF \
      -DLLAMA_KVMEM=ON \
      -DLLAMA_KVMEM_ROOT="${srcdir}"/kvmem
  cmake --build build --target llama-kvmem-server
}

package() {
  install -Dm 755 build/bin/llama-kvmem-server -t "${pkgdir}"/usr/bin/
  install -dm 755 "${pkgdir}"/usr/lib/kvmem
  cp -a build/bin/lib{ggml,ggml-base,ggml-cpu,ggml-cuda,llama,llama-common,mtmd}.so* "${pkgdir}"/usr/lib/kvmem/
  local _f
  for _f in "${pkgdir}"/usr/bin/llama-kvmem-server $(find "${pkgdir}"/usr/lib/kvmem -type f); do
    if chrpath -l "${_f}" >/dev/null; then
      chrpath -r /usr/lib/kvmem "${_f}"
    fi
  done
  install -Dm 644 kvmem/backends/llamacpp/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
