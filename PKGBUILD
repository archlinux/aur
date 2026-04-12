# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=llama.cpp-vulkan-gemma4
_pkgname=${pkgname%%-vulkan-gemma4}
pkgver=b8763
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with Vulkan GPU optimizations)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  python
  vulkan-icd-loader
)
makedepends=(
  cmake
  git
  shaderc
  vulkan-headers
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
  'python-gguf: needed for convert_hf_to_gguf.py'
)
provides=(${_pkgname} libggml ggml)
conflicts=(${_pkgname} libggml ggml stable-diffusion.cpp)
options=(lto !debug)
backup=("etc/conf.d/llama.cpp")
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.service"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.conf"
  "0001-chat-use-AST-only-path-for-Gemma-4-tool-call-parsing.patch"
  "0002-chat-add-end-of-turn-stop-sequence-for-Gemma-4.patch"
  "0003-templates-fix-Gemma-4-template-crash-on-array-typed-.patch"
  "0004-tests-add-Gemma-4-edge-case-tests-for-tool-calls-and.patch"
  "0005-common-add-FC-format-validation-reference-for-Gemma-.patch"
  "0006-server-add-Gemma-4-reasoning-control-in-web-UI.patch"
)
sha256sums=('5bdb48d76549e11c0fbdc2a058538f1dd881830efc3fd5e44a11bf32d2bb2d70'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d'
            'e4856f186f69cd5dbfcc4edec9f6b6bd08e923bceedd8622eeae1a2595beb2ec'
            'a872fbbb63d7b65567d6f28713020250e8338fa0438d1ab0e3c067856a5ef461'
            'b8832537c7c7e5495075500f470253e7a101e49ef6bd626c82655b8a06cd04bf'
            '5a3b92ffce6c7abb39a8a595af0edc5097d2c57c7575945498676066eace6b92'
            '0968bba40e35c2cc3ff24f7f9ca1199c0bbb4bb06a308f23d3d5accf3c4aea5e'
            '7da02e217bc3e15ac4e0ba515287ab39371758b5439ea8a1cefde1bb6e8cd835'
            'c9644fcc0e467a06d722f79a1dc421aefade1d36a8b8f6fe8bc6a9a5f12c2786')

prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp
  cd ${_pkgname}-${pkgver}
  patch -Np1 -i ../0001-chat-use-AST-only-path-for-Gemma-4-tool-call-parsing.patch
  patch -Np1 -i ../0002-chat-add-end-of-turn-stop-sequence-for-Gemma-4.patch
  patch -Np1 -i ../0003-templates-fix-Gemma-4-template-crash-on-array-typed-.patch
  patch -Np1 -i ../0004-tests-add-Gemma-4-edge-case-tests-for-tool-calls-and.patch
  patch -Np1 -i ../0005-common-add-FC-format-validation-reference-for-Gemma-.patch
  patch -Np1 -i ../0006-server-add-Gemma-4-reasoning-control-in-web-UI.patch
}

build() {
  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_VULKAN=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DLLAMA_BUILD_NUMBER="${pkgver#b}"
    -Wno-dev
  )

  _cmake_options+=(
    -DGGML_NATIVE=ON
    -DGGML_AVX512=ON
    -DGGML_AVX512_VBMI=ON
    -DGGML_AVX512_VNNI=ON
    -DGGML_AVX512_BF16=ON
  )

  if [[ -n "$LLAMA_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $LLAMA_BUILD_EXTRA_ARGS"
    _cmake_options+=($LLAMA_BUILD_EXTRA_ARGS)
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build -- -j $(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"

  msg2 "llama.cpp.service is now available"
  msg2 "llama-server arguments are in /etc/conf.d/llama.cpp"
}
