# Maintainer: Jakov Petrina <jkv.petrina@gmail.com>
# Adapted-from: https://aur.archlinux.org/packages/llama.cpp
# Adapted-from: https://aur.archlinux.org/packages/llama.cpp-hip

pkgname=buun-llama.cpp-hip
_pkgname="${pkgname%-hip}"
_reponame=buun-llama-cpp
pkgver=b9637
pkgrel=2
pkgdesc="Experimental llama.cpp fork with Trellis-Coded Quantization (TCQ) for KV cache compression (with AMD ROCm optimizations)"
arch=(x86_64)
url='https://github.com/spiritbuun/buun-llama-cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  hip-runtime-amd
  hipblas
  openmp
  python
  rocblas
)
makedepends=(
  cmake
  git
  nodejs
  npm
  rocm-hip-sdk
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
  'python-gguf: needed for convert_hf_to_gguf.py'
)
provides=(llama.cpp libggml libggml-hip.so ggml)
conflicts=(llama.cpp libggml ggml stable-diffusion.cpp)
options=(lto !debug)
backup=("etc/conf.d/llama.cpp")
install='llama.cpp.install'
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/spiritbuun/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
  'llama.cpp.conf'
  'llama.cpp.service'
  'llama.cpp.install'
  'sysusers.conf'
  'tmpfiles.conf'
  "0001-ggml-hip-CMakeLists-fix-HIP-build-by-excluding-bsa_-.patch"
)
sha256sums=('98832cd360bdf321487a84ed764812fff5b0cda464e196ea88f35126d16ba802'
            'e4856f186f69cd5dbfcc4edec9f6b6bd08e923bceedd8622eeae1a2595beb2ec'
            '48d6b261315c9175b4b4cea4900bd4d76f2f27112804934db656537485510cd2'
            'c534b4c37ff8ac9174a2f6f410daa96d991e8c638f338383ffb07613c771724b'
            'e687106ee9f6a5f0de4f286015f85a60e68d884e8100c67810b709960c354148'
            '402a44f609785fbabc7afca6e8a486ff517933661e9e7f4955fed6574eac9875'
            '6bc864d6607429e781a5608c8f4882103ad1409f9771f0cfa4fc70a8327a4460')

prepare() {
  ln -sf "${_reponame}-${pkgver}" "${_pkgname}"

  patch -p1 -d "${_pkgname}" -i "${srcdir}/0001-ggml-hip-CMakeLists-fix-HIP-build-by-excluding-bsa_-.patch"

  # Tailwind v4's oxide scanner walks up looking for the nearest .git to anchor
  # .gitignore lookup. In AUR helpers (yay/paru) the parent .git is the AUR
  # clone, whose .gitignore is `*` + an allowlist for PKGBUILD/.SRCINFO. That
  # rule ignores tools/ui/src/lib/**/*.svelte, so Tailwind scans zero files and
  # the built bundle.css ships without any utility classes. An empty .git in
  # the extracted source tree stops the upward walk before that point.
  mkdir -p "${_pkgname}/.git"
}

build() {
  pushd "${_pkgname}/tools/ui"
  npm ci
  npm run build
  popd

  if [[ -z "${ROCM_PATH}" ]]; then
    source /etc/profile
  fi
  export HIP_PATH="$(hipconfig -R)"
  export HIPCXX="$(hipconfig -l)/clang"
  export HIP_PLATFORM=amd

  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_HIP_FLAGS="-mllvm --amdgpu-unroll-threshold-local=600"
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DLLAMA_BUILD_WEBUI=ON
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_HIP=ON
    -DGGML_HIP_GRAPHS=OFF # ON breaks runtime
    -DHIP_PLATFORM=amd
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DLLAMA_BUILD_NUMBER="${pkgver#b}"
    -Wno-dev
  )

  if [ -n "$CI" ] && [ "$CI" != 0 ]; then
    msg2 "CI = $CI detected, building universal package"
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_CPU_ALL_VARIANTS=ON
      -DGGML_NATIVE=OFF
      -DAMDGPU_TARGETS="gfx906;gfx1010;gfx1030;gfx1031;gfx1100;gfx1101;gfx1102;gfx1151;gfx1200;gfx1201"
    )
  else
    _cmake_options+=(
      -DGGML_NATIVE=ON
    )
  fi

  if [[ -n "$LLAMA_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $LLAMA_BUILD_EXTRA_ARGS"
    _cmake_options+=($LLAMA_BUILD_EXTRA_ARGS)
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build -- -j $(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
  install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/llama-cpp.conf"
  install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/llama-cpp.conf"
}
