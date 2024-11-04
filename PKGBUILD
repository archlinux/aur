# Maintainer: robertfoster

pkgbase=whisper.cpp
pkgname=(
  "${pkgbase}"
  "${pkgbase}-cuda"
  "${pkgbase}-openvino"
  "${pkgbase}-vulkan"
)
pkgver=1.7.1
pkgrel=4
pkgdesc="Port of OpenAI's Whisper model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('glibc' 'gcc-libs')
makedepends=(
  'blas-openblas'
  'cmake'
  'cuda'
  'git'
  'openvino'
  'vulkan-icd-loader'
)

source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

prepare() {
  for _pkg in "${pkgname[@]}"; do
    if [ ! -d "${srcdir}/${_pkg}" ]; then
      cp -r "${srcdir}/${pkgbase}-${pkgver}" "${srcdir}/${_pkg}"
    fi
  done
}

_package() {
  for i in build/bin/*; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${pkgbase}-${i//build\/bin\//}"
  done
  mv "${pkgdir}/usr/bin/${pkgbase}-main" \
    "${pkgdir}/usr/bin/${pkgbase}"
  rm "${pkgdir}/usr/include/"ggml*
  rm "${pkgdir}/usr/lib/libggml.so"

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgbase}"
}

build() {
  local _cmake_args=(
    -B build
    -S .
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=Release
  )
  local _cmake_openblas_args=(
    "${_cmake_args[@]}"
    -DGGML_OPENBLAS=1
  )

  local _cmake_cuda_args=(
    "${_cmake_args[@]}"
    -DGGML_CUDA=1
  )

  local _cmake_openvino_args=(
    "${_cmake_args[@]}"
    -DWHISPER_OPENVINO=1
  )

  local _cmake_vulkan_args=(
    "${_cmake_args[@]}"
    -DGGML_VULKAN=1
  )

  echo "Build ${pkgbase} with OPENBlas"
  cd "${srcdir}/${pkgbase}"
  cmake "${_cmake_openblas_args[@]}"
  cmake --build build

  echo "Build ${pkgbase} with CUDA (NVIDIA CUDA)"
  cd "${srcdir}/${pkgbase}-cuda"
  export PATH+=":/opt/cuda/bin"
  cmake "${_cmake_cuda_args[@]}"
  cmake --build build

  echo "Build ${pkgbase} with OpenVINO run-time"
  cd "${srcdir}/${pkgbase}-openvino"
  source /opt/intel/openvino/setupvars.sh
  cmake "${_cmake_openvino_args[@]}"
  cmake --build build

  echo "Build ${pkgbase} with Vulkan run-time"
  cd "${srcdir}/${pkgbase}-vulkan"
  cmake "${_cmake_vulkan_args[@]}"
  cmake --build build
}

package_whisper.cpp() {
  pkgdesc="$pkgdesc (with OPENBlas CPU optimizations)"
  depends+=('blas-openblas')
  provides=("${pkgbase}=${pkgver}")

  cd "${pkgbase}"
  DESTDIR="${pkgdir}" cmake --install build
  _package
}

package_whisper.cpp-cuda() {
  pkgdesc="$pkgdesc (with NVIDIA CUDA optimizations)"
  depends+=('cuda')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}-cuda"
  DESTDIR="${pkgdir}" cmake --install build
  _package
}

package_whisper.cpp-openvino() {
  pkgdesc="$pkgdesc (with OpenVINO run-time)"
  depends+=('openvino' 'pugixml')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}-openvino"
  DESTDIR="${pkgdir}" cmake --install build
  _package
}

package_whisper.cpp-vulkan() {
  pkgdesc="$pkgdesc (with Vulkan optimizations)"
  depends+=('vulkan-driver' 'vulkan-icd-loader')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}-vulkan"
  DESTDIR="${pkgdir}" cmake --install build
  _package
}

sha256sums=('97f19a32212f2f215e538ee37a16ff547aaebc54817bd8072034e02466ce6d55')
