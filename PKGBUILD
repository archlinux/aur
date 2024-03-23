# Maintainer: robertfoster

_name=llama.cpp
pkgbase="${_name}-git"
pkgname=(
  "${pkgbase}"
  "${_name}-cublas-git"
  "${_name}-clblas-git"
  "${_name}-hipblas-git"
  "${_name}-sycl-f16-git"
  "${_name}-sycl-f32-git"
)
pkgver=b2510
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/llama.cpp"
license=("MIT")
depends=('openmpi')
makedepends=(
  'ccache'
  'clblast'
  'cmake'
  'cuda'
  'git'
  'hipblas'
  'intel-oneapi-basekit'
  'openblas'
  'openblas64'
)
conflicts=("${_name}")
provides=("${_name}")
source=("${_name}::git+${url}")

pkgver() {
  cd "${srcdir}/${_name}"

  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}"

  if [ ! -d "${_name}-cublas" ]; then
    cp -r "${_name}" "${_name}-cublas"
    cp -r "${_name}" "${_name}-openblas"
    cp -r "${_name}" "${_name}-clblas"
    cp -r "${_name}" "${_name}-hipblas"
    cp -r "${_name}" "${_name}-sycl"
  fi
}

build() {
  local _cmake_args=(
    -B build
    -S .
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=Release
    -DLLAMA_MPI=ON
  )

  local _cmake_clblas_args=(
    "${_cmake_args[@]}"
    -DLLAMA_CLBLAST=ON
  )

  local _cmake_cublas_args=(
    "${_cmake_args[@]}"
    -DLLAMA_CUBLAS=ON
  )

  local _cmake_hipblas_args=(
    "${_cmake_args[@]}"
    -DLLAMA_HIPBLAS=ON
  )

  local _cmake_openblas_args=(
    "${_cmake_args[@]}"
    -DLLAMA_BLAS=ON
    -DLLAMA_BLAS_VENDOR=OpenBLAS
  )

  local _cmake_sycl_32_args=(
    "${_cmake_args[@]}"
    -DCMAKE_C_COMPILER=icx
    -DCMAKE_CXX_COMPILER=icpx
    -DLLAMA_SYCL=ON
  )

  local _cmake_sycl_16_args=(
    "${_cmake_sycl_32_args[@]}"
    -DLLAMA_SYCL_F16=ON
  )

  echo "Build ${pkgbase} with OpenCL"
  cd "${srcdir}/${_name}-clblas"
  cmake "${_cmake_clblas_args[@]}"
  cmake --build build

  echo "Build ${pkgbase} with CUBlas (NVIDIA CUDA)"
  cd "${srcdir}/${_name}-cublas"
  cmake "${_cmake_cublas_args[@]}"
  cmake --build build

  echo "Build ${pkgbase} with HIPBlas (AMD ROCm)"
  cd "${srcdir}/${_name}-hipblas"
  CC=/opt/rocm/llvm/bin/clang CXX=/opt/rocm/llvm/bin/clang++ \
    cmake "${_cmake_hipblas_args[@]}"
  cmake --build build

  echo "Build ${pkgbase} with OPENBlas"
  cd "${srcdir}/${_name}-openblas"
  cmake "${_cmake_openblas_args[@]}"
  cmake --build build

  echo "Build ${pkgbase} with Intel SYCL (f16)"
  source /opt/intel/oneapi/setvars.sh
  cd "${srcdir}/${_name}-sycl"
  cmake "${_cmake_sycl_16_args[@]}"
  cmake --build build

  echo "Build ${pkgbase} with Intel SYCL (f32)"
  source /opt/intel/oneapi/setvars.sh
  cd "${srcdir}/${_name}-sycl"
  cmake "${_cmake_sycl_32_args[@]}"
  cmake --build build
}

package_llama.cpp-git() {
  pkgdesc="$pkgdesc (with OPENBlas CPU optimizations)"
  depends+=('openblas'
    'openblas64')
  provides=("${pkgbase}=${pkgver}")

  cd "${_name}-openblas"
  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}/usr/bin/"*
  cd build/bin/
  for i in *; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${_name}-${i}"
  done
  mv "${pkgdir}/usr/bin/${_name}-main" \
    "${pkgdir}/usr/bin/${_name}"
}

package_llama.cpp-clblas-git() {
  pkgdesc="$pkgdesc (with OpenCL optimizations)"
  depends+=('clblast')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${_name}-clblas"
  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}/usr/bin/"*
  cd build/bin/
  for i in *; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${_name}-${i}"
  done
  mv "${pkgdir}/usr/bin/${_name}-main" \
    "${pkgdir}/usr/bin/${_name}"
}

package_llama.cpp-cublas-git() {
  pkgdesc="$pkgdesc (with NVIDIA CUDA optimizations)"
  depends+=('cuda')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${_name}-clblas"
  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}/usr/bin/"*
  cd build/bin/
  for i in *; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${_name}-${i}"
  done
  mv "${pkgdir}/usr/bin/${_name}-main" \
    "${pkgdir}/usr/bin/${_name}"
}

package_llama.cpp-hipblas-git() {
  pkgdesc="$pkgdesc (with AMD ROCm optimizations)"
  depends+=('hipblas')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${_name}-hipblas"
  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}/usr/bin/"*
  cd build/bin/
  for i in *; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${_name}-${i}"
  done
  mv "${pkgdir}/usr/bin/${_name}-main" \
    "${pkgdir}/usr/bin/${_name}"
}

package_llama.cpp-sycl-f16-git() {
  pkgdesc="$pkgdesc (with Intel SYCL GPU optimizations and F16)"
  depends+=('intel-oneapi-basekit')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${_name}-sycl"
  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}/usr/bin/"*
  cd build/bin/
  for i in *; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${_name}-${i}"
  done
  mv "${pkgdir}/usr/bin/${_name}-main" \
    "${pkgdir}/usr/bin/${_name}"
}

package_llama.cpp-sycl-f32-git() {
  pkgdesc="$pkgdesc (with Intel SYCL GPU optimizations and F32)"
  depends+=('intel-oneapi-basekit')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${_name}-sycl"
  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}/usr/bin/"*
  cd build/bin/
  for i in *; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${_name}-${i}"
  done
  mv "${pkgdir}/usr/bin/${_name}-main" \
    "${pkgdir}/usr/bin/${_name}"
}

sha256sums=('SKIP')
