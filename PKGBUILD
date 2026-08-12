# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=beellama.cpp-cuda
_pkgname=beellama.cpp
pkgver=0.4.3
pkgrel=1
pkgdesc="DFlash & TurboQuant fork of llama.cpp — up to 3x faster generation and 7.5x more KV cache (CUDA)"
arch=('x86_64')
url="https://github.com/Anbeeld/beellama.cpp"
license=('MIT')
backup=('etc/conf.d/beellama.conf')
depends=(
  'cuda'
  'curl'
  'gcc-libs'
  'glibc'
  'nvidia-utils'
  'openssl'
)
makedepends=(
  'cmake'
  'gcc14'
  'ninja'
)
optdepends=(
  'python-numpy: convert_hf_to_gguf.py'
  'python-safetensors: convert_hf_to_gguf.py'
  'python-sentencepiece: convert_hf_to_gguf.py'
  'python-pytorch: convert_hf_to_gguf.py'
  'python-transformers: convert_hf_to_gguf.py'
  'rdma-core: RDMA transport for RPC backend'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin" 'llama.cpp' 'libggml' 'ggml')
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "beellama.conf"
  "beellama.service"
)
sha256sums=('c5d8e42f4cfba6d34c182bfb579b2fd4acb53e41dbcb8166d205d1c4125a3e79'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            'b019eb0dbc511f0e411214650184d1fb1fb39a40bce0f418d53dd71bf244e01b')



latestver() {
  gh api --paginate repos/Anbeeld/beellama.cpp/releases --jq \
    '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
    sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

build() {
  if ! type -P nvcc &>/dev/null && [[ -d /opt/cuda/bin ]]; then
    export PATH="/opt/cuda/bin:$PATH"
  fi

  # CUDA 12.9 cudafe++ cannot parse GCC 15 <type_traits>; GCC 14 works
  local _nvcc_host_cxx="${CUDAHOSTCXX:-/usr/bin/g++-14}"

  cmake \
    -G Ninja \
    -B build \
    -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}/=" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}/=" \
    -DCMAKE_CUDA_FLAGS="-Xcompiler=-ffile-prefix-map=${srcdir}/=" \
    -DCMAKE_CUDA_HOST_COMPILER="${_nvcc_host_cxx}" \
    -DBUILD_SHARED_LIBS=ON \
    -DGGML_CUDA=ON \
    -DGGML_CUDA_FA_ALL_QUANTS=ON \
    -DGGML_NATIVE=ON \
    -DCMAKE_CUDA_ARCHITECTURES=native \
    -DGGML_LTO=ON \
    -DGGML_OPENMP=ON \
    -DGGML_RPC=ON \
    -DLLAMA_BUILD_TESTS=OFF \
    -DLLAMA_BUILD_SERVER=ON \
    -DLLAMA_OPENSSL=ON \
    -DLLAMA_BUILD_UI=OFF \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 beellama.conf "${pkgdir}/etc/conf.d/beellama.conf"
  install -Dm644 beellama.service "${pkgdir}/usr/lib/systemd/system/beellama.service"
}
