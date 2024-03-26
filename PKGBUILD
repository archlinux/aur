# Maintainer: robertfoster

pkgbase=whisper.cpp
pkgname=(
  "${pkgbase}"
  "${pkgbase}-cublas"
  "${pkgbase}-clblas"
  "${pkgbase}-openvino"
)
pkgver=1.5.4
pkgrel=3
pkgdesc="Port of OpenAI's Whisper model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('glibc' 'gcc-libs')
makedepends=(
  'clblast'
  'cmake'
  'cuda'
  'git'
  'blas-openblas'
  'openvino'
)
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

prepare() {
  if [ ! -d "${srcdir}/${pkgbase}-clblas" ]; then
    cp -r "${srcdir}/${pkgbase}-${pkgver}" \
      "${srcdir}/${pkgbase}-clblas"
    cp -r "${srcdir}/${pkgbase}-${pkgver}" \
      "${srcdir}/${pkgbase}-cublas"
    cp -r "${srcdir}/${pkgbase}-${pkgver}" \
      "${srcdir}/${pkgbase}-openblas"
    cp -r "${srcdir}/${pkgbase}-${pkgver}" \
      "${srcdir}/${pkgbase}-openvino"
  fi
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
    -DWHISPER_CUBLAS=ON
  )

  local _cmake_openvino_args=(
    "${_cmake_args[@]}"
    -DWHISPER_OPENVINO=on
  )

  echo "Build ${pkgbase} with OPENBlas"
  cd "${srcdir}/${pkgbase}-openblas"
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

  cd "${pkgbase}-openblas"
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

package_whisper.cpp-openvino() {
  pkgdesc="$pkgdesc (with OpenVINO run-time)"
  depends+=('openvino' 'pugixml')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${pkgbase}-openvino"
  DESTDIR="${pkgdir}" cmake --install build
  _package
}

sha256sums=('06eed84de310fdf5408527e41e863ac3b80b8603576ba0521177464b1b341a3a')
