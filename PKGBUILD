# Maintainer:  dreieck

_pkgbase='adaptivecpp'
_vcssuffix='-git'
pkgbase="${_pkgbase}${_vcssuffix}"
pkgname=(
  "${_pkgbase}-common${_vcssuffix}"
  "${_pkgbase}-cpu${_vcssuffix}"
  # "${_pkgbase}-cuda${_vcssuffix}" # We skip CUDA build since even with package `cuda` installed `cmake` complains about CUDA not found.
  "${_pkgbase}-opencl${_vcssuffix}"
  "${_pkgbase}-rocm${_vcssuffix}"
)
pkgver=23.10.0+130.r2453.20240207.f144e21f
pkgrel=1
pkgdesc="Independent, community-driven modern platform for C++-based heterogeneous programming models targeting CPUs and GPUs from all major vendors. (formerly known as hipSYCL / Open SYCL)."
arch=(
  'x86_64'
)
url="https://github.com/AdaptiveCpp/AdaptiveCpp"
license=('BSD-2-Clause')
makedepends=(
  'boost'
  'clang'
  'cmake'
  # 'cuda' # We skip CUDA build.
  # 'doxygen'
  'gcc-libs'
  'git'
  'glibc'
  'hip-runtime-amd'
  'libffi'
  'libxml2'
  'llvm'
  'llvm-libs'
  'ncurses'
  'opencl-clhpp'
  'opencl-headers'
  'openmp'
  'rocm-llvm'
  'zlib'
  'zstd'
)
source=(
  "${_pkgbase}::git+${url}.git"  # Official upstream source.
  # "llvm-spirv-translator::git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git"  # Needed for OpenCL backend build. But somehow the result is errorneous if we do not let the build process clone it itself :-(, so we let the build process clone it.
  # "spirv-headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git"                  # Needed for OpenCL backend build. But somehow the result is errorneous if we do not let the build process clone it itself :-(, so we let the build process clone it.
  # "opencl-clhpp::git+https://github.com/KhronosGroup/OpenCL-CLHPP.git"                    # Needed for OpenCL backend build. But somehow the result is errorneous if we do not let the build process clone it itself :-(, so we let the build process clone it.
  # "opencl-headers::git+https://github.com/KhronosGroup/OpenCL-Headers.git"                # Needed for OpenCL backend build. But somehow the result is errorneous if we do not let the build process clone it itself :-(, so we let the build process clone it.
)
sha256sums=(
  'SKIP'  # Official upstream source.
  # 'SKIP'  # llvm-spirv-translator
  # 'SKIP'  # spirv-headers
  # 'SKIP'  # opencl-clhpp
  # 'SKIP'  # opencl-headers
)

_cmake_general_options=(
  -S "${_pkgbase}"
  -DCMAKE_BUILD_TYPE=Release
  -DCMAKE_INSTALL_PREFIX=/usr
  -DFETCHCONTENT_FULLY_DISCONNECTED=OFF    # Switch this to on to not download stuff during the `cmake` process. But pre-download might fail.
  -DFETCHCONTENT_QUIET=OFF
  -DFETCHCONTENT_UPDATES_DISCONNECTED=OFF  # Switch this to on to not download stuff during the `cmake` process. But pre-download might fail.
  -DFETCHCONTENT_UPDATES_DISCONNECTED_LLVMSPIRVTRANSLATOR="_deps/llvmspirvtranslator-src"
  -DFETCHCONTENT_UPDATES_DISCONNECTED_OCL-CXX-HEADERS="_deps/ocl-cxx-headers-src"
  -DFETCHCONTENT_UPDATES_DISCONNECTED_OCL-HEADERS="_deps/ocl-headers-src"
  -DACPP_CONFIG_FILE_GLOBAL_INSTALLATION=ON
  -DBUILD_DOCS=ON
  -DBUILD_EXAMPLES=ON
  -DHIPSYCL_DEBUG_LEVEL=2
  -DLLVM_DIR=/usr/lib/cmake/llvm
  -DWITH_SSCP_COMPILER=ON
  -DWITH_STDPAR_COMPILER=ON
)
_cmake_cpu_options=(
  ## CPU only.
  # -DHIPCC_COMPILER= # FIXME: Maybe need to specify generic executable (and appropriate (make)dependency might be needed to be added).
  # -DHIP_DIR= # FIXME: Maybe need to specify generic directory (and appropriate (make)dependency might be needed to be added).
  -DWITH_ACCELERATED_CPU=ON
  -DWITH_CUDA_BACKEND=OFF
  -DWITH_CUDA_NVCXX_ONLY=OFF
  -DWITH_OPENCL_BACKEND=OFF
  -DWITH_ROCM_BACKEND=OFF
)
_cmake_cuda_options=(
  ## CUDA (NVIDIA) + OpenCL + CPU.
  # -DHIPCC_COMPILER= # FIXME: Need to specify CUDA specific executable (and appropriate (make)dependency might be needed to be added).
  # -DHIP_DIR= # FIXME: Need to specify CUDA specific directory (and appropriate (make)dependency might be needed to be added).
  -DCUDAToolkit_NVCC_EXECUTABLE=/opt/cuda/bin/nvcc
  -DWITH_ACCELERATED_CPU=ON
  -DWITH_CUDA_BACKEND=ON
  -DWITH_CUDA_NVCXX_ONLY=OFF
  -DWITH_OPENCL_BACKEND=ON
  -DWITH_ROCM_BACKEND=OFF
)
_cmake_opencl_options=(
  ## OpenCL + CPU.
  # -DHIPCC_COMPILER= # FIXME: Maybe need to specify OpenCL specific executable (and appropriate (make)dependency might be needed to be added).
  # -DHIP_DIR= # FIXME: Maybe need to specify OpenCL specific directory (and appropriate (make)dependency might be needed to be added).
  -DWITH_ACCELERATED_CPU=ON
  -DWITH_CUDA_BACKEND=OFF
  -DWITH_CUDA_NVCXX_ONLY=OFF
  -DWITH_OPENCL_BACKEND=ON
  -DWITH_ROCM_BACKEND=OFF
)
_cmake_rocm_options=(
  ## ROCm (AMD Radeon) + OpenCL + CPU.
  -DHIPCC_COMPILER=/opt/rocm/bin/hipcc  # Provided by package `hip-runtime-amd`.
  -DHIP_DIR=/opt/rocm/lib/cmake/hip     # Provided by package `hip-runtime-amd`.
  -DROCM_PATH=/opt/rocm
  -DWITH_ACCELERATED_CPU=ON
  -DWITH_CUDA_BACKEND=OFF
  -DWITH_CUDA_NVCXX_ONLY=OFF
  -DWITH_OPENCL_BACKEND=ON
  -DWITH_ROCM_BACKEND=ON
)

_prepare_cpu() {
  cd "${srcdir}"

  if [ -e build-cpu ]; then
    rm -rf build-cpu
  fi
  mkdir -p build-cpu

  cmake -B build-cpu "${_cmake_general_options[@]}" "${_cmake_cpu_options[@]}"
}

_prepare_cuda() {
  cd "${srcdir}"

  if [ -e build-cuda ]; then
    rm -rf build-cuda
  fi
  mkdir -p build-cuda
  # mkdir -p build-cuda/_deps
  # mkdir -p build-cuda/_deps/llvmspirvtranslator-build

  # ln -sv "${srcdir}/llvm-spirv-translator" "build-cuda/_deps/llvmspirvtranslator-src"
  # ln -sv "${srcdir}/spirv-headers" "build-cuda/_deps/llvmspirvtranslator-build/SPIRV-Headers"
  # ln -sv "${srcdir}/opencl-clhpp" "build-cuda/_deps/ocl-cxx-headers-src"
  # ln -sv "${srcdir}/opencl-headers" "build-cuda/_deps/ocl-headers-src"

  cmake -B build-cuda "${_cmake_general_options[@]}" "${_cmake_cuda_options[@]}"
}

_prepare_opencl() {
  cd "${srcdir}"

  if [ -e build-opencl ]; then
    rm -rf build-opencl
  fi
  mkdir -p build-opencl
  # mkdir -p build-opencl/_deps
  # mkdir -p build-opencl/_deps/llvmspirvtranslator-build

  # ln -sv "${srcdir}/llvm-spirv-translator" "build-opencl/_deps/llvmspirvtranslator-src"
  # ln -sv "${srcdir}/spirv-headers" "build-opencl/_deps/llvmspirvtranslator-build/SPIRV-Headers"
  # ln -sv "${srcdir}/opencl-clhpp" "build-opencl/_deps/ocl-cxx-headers-src"
  # ln -sv "${srcdir}/opencl-headers" "build-opencl/_deps/ocl-headers-src"

  cmake -B build-opencl "${_cmake_general_options[@]}" "${_cmake_opencl_options[@]}"
}

_prepare_rocm() {
  cd "${srcdir}"

  if [ -e build-rocm ]; then
    rm -rf build-rocm
  fi
  mkdir -p build-rocm
  # mkdir -p build-rocm/_deps
  # mkdir -p build-rocm/_deps/llvmspirvtranslator-build

  # ln -sv "${srcdir}/llvm-spirv-translator" "build-rocm/_deps/llvmspirvtranslator-src"
  # ln -sv "${srcdir}/spirv-headers" "build-rocm/_deps/llvmspirvtranslator-build/SPIRV-Headers"
  # ln -sv "${srcdir}/opencl-clhpp" "build-rocm/_deps/ocl-cxx-headers-src"
  # ln -sv "${srcdir}/opencl-headers" "build-rocm/_deps/ocl-headers-src"

  cmake -B build-rocm "${_cmake_general_options[@]}" "${_cmake_rocm_options[@]}"
}

prepare() {
  cd "${srcdir}"

  msg2 "Running preparation for CPU backend ..."
  _prepare_cpu

  ## We skip CUDA build.
  # msg2 "Running preparation for CUDA (NVIDIA) + OpenCL + CPU backend ..."
  # _prepare_cuda

  msg2 "Running preparation for OpenCL + CPU backend ..."
  _prepare_opencl

  msg2 "Running preparation for ROCm (AMD Radeon) + OpenCL + CPU backend ..."
  _prepare_rocm

  cd "${srcdir}/${_pkgbase}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}


_build_cpu() {
  cd "${srcdir}"

  make -C build-cpu -j`nproc`
}

_build_cuda() {
  cd "${srcdir}"

  make -C build-cuda -j`nproc`
}

_build_opencl() {
  cd "${srcdir}"

  make -C build-opencl -j`nproc`
}

_build_rocm() {
  cd "${srcdir}"

  make -C build-rocm -j`nproc`
}

build() {
  msg2 "Building for CPU backend ..."
  _build_cpu

  ## We skip CUDA build.
  # msg2 "Building for CUDA (NVIDIA) + OpenCL + CPU backend ..."
  # _build_cuda

  msg2 "Building for OpenCL + CPU backend ..."
  _build_opencl

  msg2 "Building for ROCm (AMD Radeon) + OpenCL + CPU backend ..."
  _build_rocm
}

_package_common() {
  pkgdesc="Independent, community-driven modern platform for C++-based heterogeneous programming models targeting CPUs and GPUs from all major vendors. (formerly known as hipSYCL / Open SYCL). Common files."
  depends=()
  provides=(
    "${_pkgbase}-common=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}-common"
  )
  optdepends=(
    "${_pkgbase}-cpu${_vcssuffix}=${pkgver}:    For CPU only backend."
    "${_pkgbase}-cuda${_vcssuffix}=${pkgver}:   For CUDA (NVIDIA) + OpenCL + CPU backend."
    "${_pkgbase}-opencl${_vcssuffix}=${pkgver}: For OpenCL + CPU backend."
    "${_pkgbase}-rocm${_vcssuffix}=${pkgver}:   For ROCm (AMD Radeon) + OpenCL + CPU backend."
  )

  cd "${srcdir}/${_pkgbase}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}"      git.log CONTRIBUTING.md README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgbase}"  LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"     "${pkgdir}/usr/share/doc/${_pkgbase}/LICENSE"

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_package_cpu() {
  pkgdesc="Independent, community-driven modern platform for C++-based heterogeneous programming models targeting CPUs and GPUs from all major vendors. (formerly known as hipSYCL / Open SYCL). Accelerated CPU-only backend."
  depends=(
    "${_pkgbase}-common${_vcssuffix}=${pkgver}"
    "gcc-libs"
    "glibc"
    "llvm-libs"
    "python"
  )
  provides=(
    "${_pkgbase}-cpu=${pkgver}"
    "${_pkgbase}-backend"
    "hipsycl"
    "syclcc"
    "syclcc-clang"
  )
  conflicts=(
    "${_pkgbase}-cpu"
    "${_pkgbase}-backend"
    "syclcc"
    "syclcc-clang"
  )
  optdepends=()

  cd "${srcdir}"

  make DESTDIR="${pkgdir}" -C build-cpu install

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_package_cuda() {
  pkgdesc="Independent, community-driven modern platform for C++-based heterogeneous programming models targeting CPUs and GPUs from all major vendors. (formerly known as hipSYCL / Open SYCL). CUDA (NVIDIA) + OpenCL + CPU backend."
  depends=(
    "${_pkgbase}-common${_vcssuffix}=${pkgver}"
    "gcc-libs"
    "glibc"
    "llvm-libs"
    "ocl-icd"
    "python"
    "spirv-tools"
    # FIXME: Some more CUDA specific dependencies are needed to be listed.
  )
  provides=(
    "${_pkgbase}-cuda=${pkgver}"
    "${_pkgbase}-cpu=${pkgver}"
    "${_pkgbase}-cuda=${pkgver}"
    "${_pkgbase}-backend"
    "hipsycl"
    "syclcc"
    "syclcc-clang"
  )
  conflicts=(
    "${_pkgbase}-cuda"
    "${_pkgbase}-cpu"
    "${_pkgbase}-opencl"
    "${_pkgbase}-backend"
  )
  optdepends=()

  cd "${srcdir}"

  make DESTDIR="${pkgdir}" -C build-cuda install

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_package_opencl() {
  pkgdesc="Independent, community-driven modern platform for C++-based heterogeneous programming models targeting CPUs and GPUs from all major vendors. (formerly known as hipSYCL / Open SYCL). OpenCL + CPU backend."
  depends=(
    "${_pkgbase}-common${_vcssuffix}=${pkgver}"
    "gcc-libs"
    "glibc"
    "llvm-libs"
    "ocl-icd"
    "python"
    "spirv-tools"
  )
  provides=(
    "${_pkgbase}-opencl${pkgver}"
    "${_pkgbase}-cpu=${pkgver}"
    "${_pkgbase}-backend"
    "hipsycl"
    "syclcc"
    "syclcc-clang"
  )
  conflicts=(
    "${_pkgbase}-opencl"
    "${_pkgbase}-cpu"
    "${_pkgbase}-backend"
    "syclcc"
    "syclcc-clang"
  )
  optdepends=()

  cd "${srcdir}"

  make DESTDIR="${pkgdir}" -C build-opencl install

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_package_rocm() {
  pkgdesc="Independent, community-driven modern platform for C++-based heterogeneous programming models targeting CPUs and GPUs from all major vendors. (formerly known as hipSYCL / Open SYCL). ROCm (AMD Radeon) + OpenCL + CPU backend."
  depends=(
    "${_pkgbase}-common${_vcssuffix}=${pkgver}"
    "gcc-libs"
    "glibc"
    "hip-runtime-amd"
    "llvm-libs"
    "ocl-icd"
    "python"
    "spirv-tools"
  )
  provides=(
    "${_pkgbase}-rocm=${pkgver}"
    "${_pkgbase}-cpu=${pkgver}"
    "${_pkgbase}-opencl=${pkgver}"
    "${_pkgbase}-backend"
    "hipsycl"
    "syclcc"
    "syclcc-clang"
  )
  conflicts=(
    "${_pkgbase}-rocm"
    "${_pkgbase}-cpu"
    "${_pkgbase}-opencl"
    "${_pkgbase}-backend"
    "syclcc"
    "syclcc-clang"
  )
  optdepends=()

  cd "${srcdir}"

  make DESTDIR="${pkgdir}" -C build-rocm install

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


for _p in common cpu cuda opencl rocm; do
  eval "package_${_pkgbase}-${_p}${_vcssuffix}() {
    $(declare -f "_package_${_p}")
    _package_${_p}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
