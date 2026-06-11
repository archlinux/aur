# Maintainer: Jakov Petrina <jkv.petrina@gmail.com>
# Adapted-from: https://aur.archlinux.org/packages/llama.cpp
# Adapted-from: https://aur.archlinux.org/packages/llama.cpp-hip
# Adapted-from: https://aur.archlinux.org/packages/llama.cpp-git

pkgname=rocmfp4-llama.cpp-git
_pkgname=rocmfp4-llama
pkgver=b9151.r90.c4cd376
pkgrel=1
pkgdesc="Experimental llama.cpp fork with AMD-focused ROCm FP4 quantization support"
arch=(x86_64)
url='https://github.com/charlie12345/rocmfp4-llama'
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
  rocwmma
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
  "git+https://github.com/charlie12345/${_pkgname}.git#branch=mtp-rocmfp4-strix"
  'llama.cpp.conf'
  'llama.cpp.service'
  'llama.cpp.install'
  'sysusers.conf'
  'tmpfiles.conf'
)
sha256sums=('SKIP'
            'e4856f186f69cd5dbfcc4edec9f6b6bd08e923bceedd8622eeae1a2595beb2ec'
            '48d6b261315c9175b4b4cea4900bd4d76f2f27112804934db656537485510cd2'
            'c534b4c37ff8ac9174a2f6f410daa96d991e8c638f338383ffb07613c771724b'
            'e687106ee9f6a5f0de4f286015f85a60e68d884e8100c67810b709960c354148'
            '402a44f609785fbabc7afca6e8a486ff517933661e9e7f4955fed6574eac9875')

pkgver() {
  cd "$_pkgname"

  # NOTE: Use closest point-of-divergence upstream tag as base version
  git remote add upstream https://github.com/ggml-org/llama.cpp.git 2>/dev/null || true
  git fetch upstream --tags >/dev/null 2>&1 || true
  local _mergebase=$(git merge-base 'HEAD' 'upstream/master')
  printf "%s.r%s.%s" "$(git describe --tags ${_mergebase} | cut -d'-' -f1)" \
                     "$(git rev-list --count ${_mergebase}..HEAD)" \
                     "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # Tailwind v4's oxide scanner walks up looking for the nearest .git to anchor
  # .gitignore lookup. In AUR helpers (yay/paru) the parent .git is the AUR
  # clone, whose .gitignore is `*` + an allowlist for PKGBUILD/.SRCINFO. That
  # rule ignores tools/ui/src/lib/**/*.svelte, so Tailwind scans zero files and
  # the built bundle.css ships without any utility classes. An empty .git in
  # the extracted source tree stops the upward walk before that point.
  mkdir -p "${_pkgname}/.git"
}

build() {
  pushd "${_pkgname}/tools/server/webui"
  npm ci
  npm run build
  popd

  if [[ -z "${ROCM_PATH}" ]]; then
    source /etc/profile
  fi
  export HIP_PATH="$(hipconfig -R)"
  export HIPCXX="$(hipconfig -l)/clang"
  export HIP_PLATFORM=amd

  local _build_num="${pkgver#b}"; _build_num="${_build_num%%.*}"

  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_HIP_FLAGS="-mllvm --amdgpu-unroll-threshold-local=600"
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_BUILD_SERVER=ON
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DLLAMA_BUILD_WEBUI=ON
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_CUDA=OFF
    -DGGML_VULKAN=ON
    -DGGML_HIP=ON
    -DGGML_HIP_GRAPHS=OFF # ON breaks runtime
    -DGGML_HIP_ROCWMMA_FATTN=ON
    -DGGML_HIP_FORCE_MMQ=ON
    -DHIP_PLATFORM=amd
    -DLLAMA_BUILD_NUMBER="${_build_num}"
    -Wno-dev
    -DHIP_EXTRA_FLAGS="-I/opt/rocm/include/rocwmma/internal/"
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
