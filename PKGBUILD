# Maintainer: robertfoster

pkgbase=whisper.cpp
pkgname=(
  "${pkgbase}"
  "${pkgbase}-cublas"
  "${pkgbase}-clblas"
  # "${pkgbase}-hipblas"
  "${pkgbase}-openvino"
)
pkgver=1.7.1
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('glibc' 'gcc-libs')
makedepends=(
  'blas-openblas'
  'clblast'
  'cmake'
  'cuda'
  'git'
  'openvino'
  # 'rocm-hip-sdk'
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
    -DWHISPER_OPENBLAS=ON
  )

  local _cmake_clblas_args=(
    "${_cmake_args[@]}"
    -DWHISPER_CLBLAST=ON
  )

  local _cmake_cublas_args=(
    "${_cmake_args[@]}"
    -DWHISPER_CUDA=ON
  )

  local _cmake_hipblas_args=(
    "${_cmake_args[@]}"
    -DWHISPER_HIPBLAS=ON
  )

  local _cmake_openvino_args=(
    "${_cmake_args[@]}"
    -DWHISPER_OPENVINO=ON
  )

  echo "Build ${pkgbase} with OPENBlas"
  cd "${srcdir}/${pkgbase}"
  cmake "${_cmake_openblas_args[@]}"
  cmake --build build

  echo "Build ${pkgbase} with OpenCL"
  cd "${srcdir}/${pkgbase}-clblas"
  cmake "${_cmake_clblas_args[@]}"
  cmake --build build

  echo "Build ${pkgbase} with CUBlas (NVIDIA CUDA)"
  cd "${srcdir}/${pkgbase}-cublas"
  export PATH+=":/opt/cuda/bin"
  cmake "${_cmake_cublas_args[@]}"
  cmake --build build

  # echo "Build ${pkgbase} with HIPBlas (AMD ROCm)"
  # cd "${srcdir}/${pkgbase}-hipblas"
  # cmake "${_cmake_hipblas_args[@]}"
  # cmake --build build

  echo "Build ${pkgbase} with OpenVINO run-time"
  cd "${srcdir}/${pkgbase}-openvino"
  source /opt/intel/openvino/setupvars.sh
  cmake "${_cmake_openvino_args[@]}"
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

package_whisper.cpp-clblas() {
  pkgdesc="$pkgdesc (with OpenCL optimizations)"
  depends+=('clblast')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}-clblas"
  DESTDIR="${pkgdir}" cmake --install build
  _package
}

package_whisper.cpp-cublas() {
  pkgdesc="$pkgdesc (with NVIDIA CUDA optimizations)"
  depends+=('cuda')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}-cublas"
  DESTDIR="${pkgdir}" cmake --install build
  _package
}

package_whisper.cpp-hipblas() {
  pkgdesc="$pkgdesc (with AMD ROCm optimizations)"
  depends+=('rocm-hip-runtime')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}-hipblas"
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

sha256sums=('97f19a32212f2f215e538ee37a16ff547aaebc54817bd8072034e02466ce6d55')
