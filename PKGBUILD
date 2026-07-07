# Maintainer: rubin55
: ${aur_llamacpp_build_universal:=false}
_pkgname="llama.cpp"
pkgname=${_pkgname}-vulkan-git
pkgver=b9902.r11.bec4772f6a
pkgrel=1
_build_number=0
_commit_id=
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with Vulkan optimizations)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggerganov/llama.cpp'
license=('MIT')
makedepends=(
  cmake
  git
  openssl
  vulkan-headers
  spirv-headers
)
optdepends=(
'python-gguf: needed for convert_hf_to_gguf.py'
'python-numpy: needed for convert_hf_to_gguf.py'
'python-safetensors: needed for convert_hf_to_gguf.py'
'python-sentencepiece: needed for convert_hf_to_gguf.py'
'python-pytorch: needed for convert_hf_to_gguf.py'
'python-transformers: needed for convert_hf_to_gguf.py'
)
provides=("llama.cpp" "llama.cpp-git" "llama.cpp-vulkan" "llama.cpp-vulkan-git")
conflicts=("ggml" "libggml" "llama.cpp" "llama.cpp-git" "llama.cpp-cuda" "llama.cpp-cuda-git" "llama.cpp-openvino" "llama.cpp-openvino-git" "llama.cpp-sycl" "llama.cpp-sycl-git" "llama.cpp-vulkan")

source=(
"git+https://github.com/ggml-org/llama.cpp.git"
llama.cpp.conf
llama.cpp.service
)
sha256sums=('SKIP'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            'ca92122d5a47dc3d58798a03f76466a4785c70af225fd77776918034ce98d837')
options=('!strip')

pkgver() {
  cd "${_pkgname}" || exit
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${_pkgname}" || exit
  # Get the latest commit hash
  _commit_id=$(git rev-parse HEAD)
  _build_number=$(git rev-list --count HEAD)
}

build() {
  unset CFLAGS CXXFLAGS LDFLAGS

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
    -DGGML_OPENMP=ON
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_VULKAN=ON
    -DLLAMA_BUILD_SERVER=ON
    -DLLAMA_BUILD_NUMBER="${_build_number}"
    -DLLAMA_BUILD_COMMIT="${_commit_id}"
    -DLLAMA_OPENSSL=ON
    -Wno-dev
  )

  if [[ ${aur_llamacpp_build_universal} == true ]]; then
    echo "Building universal binary [aur_llamacpp_build_universal == true]"
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_NATIVE=OFF
      -DGGML_CPU_ALL_VARIANTS=ON
    )
  else
    # we lose GGML_NATIVE_DEFAULT due to how makepkg includes
    # $SOURCE_DATE_EPOCH in ENV
    _cmake_options+=(
      -DGGML_NATIVE=ON
    )
  fi

  # Allow user-specified additional flags
  if [[ -n "${aur_llamacpp_cmakeopts:-}" ]]; then
    echo "Applying custom CMake options: ${aur_llamacpp_cmakeopts}"
    # shellcheck disable=SC2206 # intentional word splitting
    _cmake_options+=(${aur_llamacpp_cmakeopts})
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/user/llama.cpp.service"
}
