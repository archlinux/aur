# Maintainer: robertfoster

_name=stable-diffusion.cpp
pkgbase="${_name}-git"
pkgname=(
  "${pkgbase}"
  "${_name}-cublas-git"
  "${_name}-hipblas-git"
)
pkgver=r108.48bcce4
pkgrel=1
pkgdesc="Stable Diffusion in pure C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/leejet/stable-diffusion.cpp"
license=("MIT")
makedepends=(
  'ccache'
  'cmake'
  'cuda'
  'git'
  'hipblas'
  'openblas'
)
conflicts=("${_name}")
provides=("${_name}")
source=("${_name}::git+${url}")

prepare() {
  cd "${srcdir}/${_name}"
  git submodule update --init

  if [ ! -d "${srcdir}/${_name}-cublas" ]; then
    cp -r "${srcdir}/${_name}" "${srcdir}/${_name}-cublas"
    cp -r "${srcdir}/${_name}" "${srcdir}/${_name}-openblas"
    cp -r "${srcdir}/${_name}" "${srcdir}/${_name}-hipblas"
  fi
}

pkgver() {
  cd "${srcdir}/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local _cmake_args=(
    -B build
    -S .
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=Release
  )

  local _cmake_cublas_args=(
    "${_cmake_args[@]}"
    -DSD_CUBLAS=ON
  )

  local _cmake_hipblas_args=(
    "${_cmake_args[@]}"
    -DCMAKE_C_COMPILER=clang
    -DCMAKE_CXX_COMPILER=clang++
    -DSD_HIPBLAS=ON
  )

  local _cmake_openblas_args=(
    "${_cmake_args[@]}"
    -DGGML_OPENBLAS=ON
  )

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
}

package_stable-diffusion.cpp-git() {
  pkgdesc="$pkgdesc (with OPENBlas CPU optimizations)"
  depends+=('openblas')
  provides=("${pkgbase}=${pkgver}")

  cd "${_name}-openblas"
  DESTDIR="${pkgdir}" cmake --install build
}

package_stable-diffusion.cpp-cublas-git() {
  pkgdesc="$pkgdesc (with NVIDIA CUDA optimizations)"
  depends+=('cuda')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${_name}-clblas"
  DESTDIR="${pkgdir}" cmake --install build
}

package_stable-diffusion.cpp-hipblas-git() {
  pkgdesc="$pkgdesc (with AMD ROCm optimizations)"
  depends+=('hipblas')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${_name}-hipblas"
  DESTDIR="${pkgdir}" cmake --install build
}

sha256sums=('SKIP')
