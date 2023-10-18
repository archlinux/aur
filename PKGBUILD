# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

# MAKEFLAGS=-j2 # NOTE Can be usseful when got OOM

_ENABLE_CUDA=1
_ENABLE_TENSORRT=0  # NOTE: not working due https://github.com/microsoft/onnxruntime/issues/15131

pkgbase=python-onnxruntime
# Not split DNNL EP to another package as it's needed unconditionally at runtime if built at compile time
# https://github.com/microsoft/onnxruntime/blob/v1.9.1/onnxruntime/python/onnxruntime_pybind_state.cc#L533
pkgname=(
  'onnxruntime'
  'python-onnxruntime'
)
pkgver=1.16.1
pkgdesc='Cross-platform, high performance scoring engine for ML models'
pkgrel=1
arch=('x86_64')
url='https://github.com/microsoft/onnxruntime'
license=('MIT')
makedepends=(
  'git'
  'cmake'
  'ninja'
  'gcc-libs'
  'glibc'
  'cxxopts'
  'pybind11'
  'abseil-cpp'
  'nlohmann-json'
  'chrono-date'
  'boost'
  'eigen'
#   'flatbuffers'
  'onednn'
#   're2'
#   'protobuf'
  'nsync'
  'openmpi'
  'python-coloredlogs'
  'python-flatbuffers'
  'python-numpy'
#   'python-protobuf'
  'python-sympy'
  'python-setuptools'
  'python-installer'
  'python-wheel'
  'python-build'

  'chrpath'
)
# not de-vendored libraries
# onnx: needs shared libonnx (https://github.com/onnx/onnx/issues/3030)
source=(
  "git+https://github.com/microsoft/onnxruntime#tag=v${pkgver}"
  'install-orttraining-files.diff'
  'system-dnnl.diff'
#   'system-flatbuffers.patch'
)
sha512sums=(
  'SKIP'
  'SKIP'
  'SKIP'
#   'SKIP'
)
options=('debug')

if [[ $_ENABLE_CUDA = 1 ]]; then
  pkgname+=('onnxruntime-cuda')
  makedepends+=(
    'cuda'
    'cudnn'
    'nccl'
  )
fi

if [[ $_ENABLE_TENSORRT = 1 ]]; then
  pkgname+=('onnxruntime-tensorrt')
  makedepends+=('tensorrt')
#   depends+=('protobuf' 'libprotobuf.so')
fi

# Check PKGBUILDs of python-pytorch and tensorflow for CUDA architectures built by official packages
_CUDA_ARCHITECTURES="52-real;53-real;60-real;61-real;62-real;70-real;72-real;75-real;80-real;86-real;87-real;89-real;90-real;90-virtual"

prepare() {
  cd onnxruntime

  # Use System Dlnn
  patch -Np1 -i "${srcdir}/system-dnnl.diff"

  # Find system nlohmann-json
  sed 's|3.10 ||g' \
    -i cmake/external/onnxruntime_external_deps.cmake

  # Find system chrono-date
  sed -e 's|${DEP_SHA1_date}|&\n \ \ \ \ \ \FIND_PACKAGE_ARGS NAMES date|g' \
      -e 's|date_interface|date::date-tz|g' \
      -i cmake/external/onnxruntime_external_deps.cmake \
      -i cmake/onnxruntime_common.cmake \
      -i cmake/onnxruntime_unittests.cmake

  # Find system abseil-cpp
  sed 's|ABSL_PATCH_COMMAND}|&\n\ \ \ \ \FIND_PACKAGE_ARGS NAMES absl|g' \
    -i cmake/external/abseil-cpp.cmake

  # Find system cxxopts
  sed 's|${DEP_SHA1_cxxopts}|&\n\ \ \ \ \FIND_PACKAGE_ARGS NAMES cxxopts|g' \
    -i cmake/external/onnxruntime_external_deps.cmake

#   # Find system mimalloc
#   sed 's|${DEP_SHA1_mimalloc}|&\n\ \ \ \ \ \ \FIND_PACKAGE_ARGS NAMES mimalloc|g' \
#     -i cmake/external/onnxruntime_external_deps.cmake

  # Find system nsync
  sed -e 's|NAMES nsync|&_cpp|g' \
      -e '295aadd_library(nsync::nsync_cpp ALIAS nsync_cpp)' \
      -i cmake/external/onnxruntime_external_deps.cmake

  if [[ $_ENABLE_TENSORRT = 1 ]]; then
    # Update Tensorboard a01ceb5957d9ecd56314df115c09e3ddb60d12f7
    sed -e 's|373eb09e4c5d2b3cc2493f0949dc4be6b6a45e81|a01ceb5957d9ecd56314df115c09e3ddb60d12f7|g' \
        -e 's|ff427b6a135344d86b65fa2928fbd29886eefaec|113750f323d131859ac4e17070d2c9417e80d701|g' \
        -i cmake/deps.txt

    # Update onnx_tensorrt 6ba67d3428e05f690145373ca87fb8d32f98df45
    sed -e 's|0462dc31ae78f48744b6141ae376df1f96d3f459|6ba67d3428e05f690145373ca87fb8d32f98df45|g' \
        -e 's|67b833913605a4f3f499894ab11528a702c2b381|113750f323d131859ac4e17070d2c9417e80d701|g' \
        -i cmake/deps.txt
  fi

  patch -Np1 -i "${srcdir}/install-orttraining-files.diff"
#   patch -Np1 -i "${srcdir}/system-flatbuffers.patch"

  # fix build with gcc12(?), take idea from https://github.com/microsoft/onnxruntime/pull/11667 and https://github.com/microsoft/onnxruntime/pull/10014
  sed 's|dims)|TensorShape(dims))|g' \
    -i onnxruntime/contrib_ops/cuda/quantization/qordered_ops/qordered_qdq.cc

  # fix missing #include <iostream>
  sed '11a#include <iostream>' \
    -i orttraining/orttraining/test/training_api/trainer/trainer.cc

#   cd onnxruntime/core/flatbuffers/schema
#   python compile_schema.py --flatc /usr/bin/flatc
}

build() {

  if [[ ${_ENABLE_CUDA} = 1 ]]; then
    export CC="/opt/cuda/bin/gcc"
    export CXX="/opt/cuda/bin/g++"
    export CUDAHOSTCXX="${CXX}"
  fi

  # Gcc 12+
  CXXFLAGS+=" -Wno-maybe-uninitialized -Wno-error=restrict"
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=2/_FORTIFY_SOURCE=0}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=2/_FORTIFY_SOURCE=0}"


  # Use -Donnxruntime_ENABLE_LAZY_TENSOR=OFF as it requires patched python-pytorch
  # See: https://github.com/microsoft/onnxruntime/pull/10460 https://github.com/pytorch/pytorch/pulls/wschin
  local _cmake_args=(
    -DCMAKE_BUILD_TYPE=Debug
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_SKIP_INSTALL_RPATH=OFF
    -DCMAKE_SKIP_RPATH=OFF
    -Donnxruntime_ENABLE_PYTHON=ON
    -Donnxruntime_BUILD_SHARED_LIB=ON
    -Donnxruntime_BUILD_UNIT_TESTS=OFF
    -Donnxruntime_ENABLE_TRAINING=ON
    -Donnxruntime_ENABLE_LAZY_TENSOR=OFF
    -Donnxruntime_USE_MPI=ON
    -Donnxruntime_USE_DNNL=ON
    -Donnxruntime_USE_PREINSTALLED_EIGEN=ON
    -Deigen_SOURCE_PATH="$(pkg-config --cflags eigen3 | sed 's|-I||g')"
    -DCMAKE_CXX_STANDARD=17
    -DCMAKE_IGNORE_PATH=/usr/lib/cmake/flatbuffers/\;/lib/cmake/flatbuffers/\;/usr/lib/cmake/protobuf/\;/lib/cmake/protobuf/
    -DBUILD_TESTING=OFF
  )

  # Use protobuf-lite instead of full protobuf to workaround symbol conflicts
  # with onnx; see https://github.com/onnx/onnx/issues/1277 for details.
  _cmake_args+=(
    -Donnxruntime_USE_FULL_PROTOBUF=OFF
  )

  if [[ ${_ENABLE_CUDA} = 1 ]]; then
    _cmake_args+=(
      -DCMAKE_CUDA_ARCHITECTURES="${_CUDA_ARCHITECTURES}"
      -DCMAKE_CUDA_STANDARD_REQUIRED=ON
      -DCMAKE_CXX_STANDARD_REQUIRED=ON
      -Donnxruntime_USE_CUDA=ON
      -Donnxruntime_CUDA_HOME=/opt/cuda
      -Donnxruntime_CUDNN_HOME=/usr
      -Donnxruntime_USE_NCCL=ON
      -Donnxruntime_NVCC_THREADS=1
    )
  fi

  if [[ ${_ENABLE_TENSORRT} = 1 ]]; then
    _cmake_args+=(
      -Donnxruntime_USE_TENSORRT=ON
      -Donnxruntime_USE_TENSORRT_BUILTIN_PARSER=ON
    )
  fi

  cmake -S onnxruntime/cmake -B build \
  "${_cmake_args[@]}" \
  "$@" \
  -G Ninja

  LC_ALL=C cmake --build build #-v

  (
  cd build
  install -Dm644 ../onnxruntime/docs/python/README.rst docs/python/README.rst
  ln -s ../onnxruntime/setup.py .
  python -m build --wheel --no-isolation
  )

}

package_onnxruntime() {
  depends=(
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # ld-linux-x86-64.so libc.so ibm.so
    'onednn' # libdnnl.so
    'openmpi' 'libmpi.so'
    'abseil-cpp' # libabsl_hash.so libabsl_raw_hash_set.so libabsl_raw_logging_internal.so libabsl_throw_delegate.so
    'nsync' # libnsync_cpp.so
#     'protobuf' 'libprotobuf-lite.so'
  )
  provides=(
    'libonnxruntime.so'
    'libonnxruntime_providers_shared.so'
  )

  DESTDIR="${pkgdir}" cmake --install build

  # installed as split packages
  rm -vf "${pkgdir}/usr/lib/"libonnxruntime_providers_{tensorrt,cuda}.so

  chrpath -d "${pkgdir}/usr/lib/"libonnxruntime.so.*

  install -Dm644 onnxruntime/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 onnxruntime/ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}

package_python-onnxruntime() {
  pkgdesc+=' (Python Bindings)'
  depends=(
    'onnxruntime'
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # ld-linux-x86-64.so libc.so libm.so
    'abseil-cpp' # libabsl_hash.so libabsl_raw_hash_set.so libabsl_raw_logging_internal.so libabsl_throw_delegate.so
    'openmpi' 'libmpi.so'
    'nsync' # libnsync_cpp.so
#     'protobuf' 'libprotobuf-lite.so'
    'python-coloredlogs'
    'python-flatbuffers'
    'python-numpy'
#     'python-protobuf'
    'python-sympy'
    'python-packaging'
    'python-setuptools'
    'python-requests'
  )
  optdepends=(
    # https://github.com/microsoft/onnxruntime/pull/9969
    'python-onnx: for the backend API, quantization, orttraining, transformers and various tools'
    'python-psutil: for transformers'
    'python-py-cpuinfo: for transformers'
    'python-py3nvml: for transformers'
    'python-transformers: for transformers'
    'python-scipy: for transformers and various tools'
    'python-pytorch: for transformers, orttraining and various tools'
    'python-pytorch-cuda'
    'python-cerberus: for orttraining'
    'python-h5py: for orttraining'
    'python-matplotlib'
    'python-tensorflow-opt-cuda'
    'python-importlib-metadata'
  )

  python -m installer --destdir="${pkgdir}" build/dist/*.whl

  _PY_ORT_DIR="$(python -c 'import site; print(site.getsitepackages()[0])')/onnxruntime"
  # already installed by `cmake --install`, and not useful as this path is not looked up by the linker
  rm -vf "${pkgdir}/${_PY_ORT_DIR}"/capi/libonnxruntime_providers_*
  chrpath -d "${pkgdir}/${_PY_ORT_DIR}/capi/onnxruntime_pybind11_state.so"

  install -Ddm755 "${pkgdir}/usr/share/licenses"
  ln -s onnxruntime "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_onnxruntime-cuda() {
  pkgdesc+=' (CUDA execution provider)'
  depends=(
    'gcc-libs' # libgcc_s.so libstdc++.so 
    'glibc' # ld-linux-x86-64.so libc.so libm.so
    'cudnn' # libcudnn.so
    'nccl' # libnccl.so
    'openmpi' 'libmpi.so'
    'nsync' # libnsync_cpp.so
    'abseil-cpp' # libabsl_hash.so libabsl_raw_hash_set.so libabsl_raw_logging_internal.so libabsl_throw_delegate.so
    'cuda' 'libcublas.so' 'libcudart.so' # libcublasLt.so libcufft.so
#     'protobuf' 'libprotobuf-lite.so'
  )
  conflicts=('python-onnxruntime-cuda')
  replaces=('python-onnxruntime-cuda')

  install -Dm755 build/libonnxruntime_providers_cuda.so -t "${pkgdir}/usr/lib"

  install -Ddm755 "${pkgdir}/usr/share/licenses"
  ln -s onnxruntime "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_onnxruntime-tensorrt() {
  pkgdesc+=' (TensorRT execution provider)'
  depends=(
    'tensorrt'
#     'protobuf' 'libprotobuf-lite.so'
    'nsync'
#     'flatbuffers'
  )
  pkgdesc+=' (TENSORRT execution provider)'

  install -Dm755 build/libonnxruntime_providers_tensorrt.so -t "${pkgdir}/usr/lib"

  install -Ddm755 "${pkgdir}/usr/share/licenses"
  ln -s onnxruntime "${pkgdir}/usr/share/licenses/${pkgname}"
}
