# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# MAKEFLAGS=-j18
_ENABLE_CUDA=1
_ENABLE_TENSORRT=0  #NOTE: not working due https://github.com/microsoft/onnxruntime/issues/15131

pkgbase=python-onnxruntime
# Not split DNNL EP to another package as it's needed unconditionally at runtime if built at compile time
# https://github.com/microsoft/onnxruntime/blob/v1.9.1/onnxruntime/python/onnxruntime_pybind_state.cc#L533
pkgname=('onnxruntime'
         'python-onnxruntime'
         )
pkgver=1.15.1
pkgdesc='Cross-platform, high performance scoring engine for ML models'
pkgrel=1
arch=('x86_64')
url='https://github.com/microsoft/onnxruntime'
license=('MIT')
depends=(
  'nsync'
  'libre2.so'
  'openmpi'
)
# if [[ $_ENABLE_TENSORRT = 1 ]]; then
#   depends+=('protobuf' 'libprotobuf.so')
# else
#   depends+=('protobuf' 'libprotobuf-lite.so')
# fi

makedepends=(
  'git'
  'cmake'
  'cxxopts'
  'pybind11'
  'abseil-cpp'
  'nlohmann-json'
  'chrono-date'
  'boost'
  'eigen'
#   'flatbuffers'
  'onednn'
  're2'
  'python-coloredlogs'
  'python-flatbuffers'
  'python-numpy'
  'python-pip'
  'python-setuptools'
  'python-protobuf'
  'python-sympy'
  'chrpath'
  'nsync'
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
fi

# Check PKGBUILDs of python-pytorch and tensorflow for CUDA architectures built by official packages
_CUDA_ARCHITECTURES="52-real;53-real;60-real;61-real;62-real;70-real;72-real;75-real;80-real;86-real;87-real;89-real;90-real;90-virtual"

prepare() {
  echo $MAKEFLAGS
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

  # Find system nsync
  sed -e 's|NAMES nsync|&_cpp|g' \
      -e '282aadd_library(nsync::nsync_cpp ALIAS nsync_cpp)' \
      -i cmake/external/onnxruntime_external_deps.cmake \

  if [[ $_ENABLE_TENSORRT = 1 ]]; then
    # Update Tensorboard 00d59e65d866a6d4b9fe855dce81ee6ba8b40c4f
    sed -e 's|373eb09e4c5d2b3cc2493f0949dc4be6b6a45e81|00d59e65d866a6d4b9fe855dce81ee6ba8b40c4f|g' \
        -e 's|67b833913605a4f3f499894ab11528a702c2b381|ff427b6a135344d86b65fa2928fbd29886eefaec|g' \
        -i cmake/deps.txt

    # Update onnx_tensorrt 6872a9473391a73b96741711d52b98c2c3e25146
    sed -e 's|ba6a4fb34fdeaa3613bf981610c657e7b663a699|6872a9473391a73b96741711d52b98c2c3e25146|g' \
        -e 's|62119892edfb78689061790140c439b111491275|75462057c95f7fdbc256179f0a0e9e4b7be28ae3|g' \
        -i cmake/deps.txt
  fi

  patch -Np1 -i "${srcdir}/install-orttraining-files.diff"
  # Force use bundled flatbuffers due fail build
  sed '/NAMES Flatbuffers/s/^/#/g' -i cmake/external/onnxruntime_external_deps.cmake
  # Same with Protobuf
  sed '/NAMES Protobuf/s/^/#/g' -i cmake/external/onnxruntime_external_deps.cmake
#   patch -Np1 -i "${srcdir}/system-flatbuffers.patch"

  # fix build with gcc12(?), take idea from https://github.com/microsoft/onnxruntime/pull/11667 and https://github.com/microsoft/onnxruntime/pull/10014
  sed 's|dims)|TensorShape(dims))|g' \
    -i onnxruntime/contrib_ops/cuda/quantization/qordered_ops/qordered_qdq.cc

  # fix missing #include <iostream>
  sed '11a#include <iostream>' \
    -i orttraining/orttraining/test/training_api/trainer/trainer.cc

  # Silence cmake warning
  sed -e 's|PRIVATE  |PRIVATE |g' \
      -e 's|2">|2>"|g' \
      -i cmake/onnxruntime_mlas.cmake

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
  CXXFLAGS+=" -Wno-maybe-uninitialized"
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
    -Donnxruntime_BUILD_UNIT_TESTS=ON
    -Donnxruntime_ENABLE_TRAINING=ON
    -Donnxruntime_ENABLE_LAZY_TENSOR=OFF
    -Donnxruntime_USE_MPI=ON
    -Donnxruntime_USE_DNNL=ON
    -Donnxruntime_USE_PREINSTALLED_EIGEN=ON
    -Deigen_SOURCE_PATH=$(pkg-config --cflags eigen3 | sed 's|-I||g')
    -DCMAKE_CXX_STANDARD=17
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
    )
  fi

  if [[ ${_ENABLE_TENSORRT} = 1 ]]; then
    _cmake_args+=(
      -Donnxruntime_USE_TENSORRT=ON
      -Donnxruntime_USE_TENSORRT_BUILTIN_PARSER=ON
    )
  fi

  cd onnxruntime/cmake
  cmake -S . -B ../../build \
  "${_cmake_args[@]}" \
  "$@"
  cd "${srcdir}"

  LC_ALL=C cmake --build build -v

  (
  cd build;
  python ../onnxruntime/setup.py bdist_wheel -d ../dist
  )

}

package_onnxruntime() {
  depends+=(
    'onednn'
    'abseil-cpp'
  )

  DESTDIR="${pkgdir}" cmake --install build

  # installed as split packages
  rm -vf "${pkgdir}/usr/lib/"libonnxruntime_providers_{tensorrt,cuda}.so

  chrpath -d "${pkgdir}/usr/lib/"libonnxruntime.so.*

  install -Dm644 onnxruntime/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 onnxruntime/ThirdPartyNotices.txt "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"

}

package_python-onnxruntime() {
  depends=(
    'onnxruntime'
    'python-coloredlogs'
    'python-flatbuffers'
    'python-numpy'
    'python-protobuf'
    'python-sympy'
    'python-packaging'
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

  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  _PY_ORT_DIR="$(python -c 'import site; print(site.getsitepackages()[0])')/onnxruntime"
  # already installed by `cmake --install`, and not useful as this path is not looked up by the linker
  rm -vf "${pkgdir}/${_PY_ORT_DIR}"/capi/libonnxruntime_providers_*
  chrpath -d "${pkgdir}/${_PY_ORT_DIR}/capi/onnxruntime_pybind11_state.so"

  install -Ddm755 "${pkgdir}/usr/share/licenses"
  ln -s onnxruntime "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_onnxruntime-cuda() {
  depends=(
    'cudnn'
    'nccl'
    'openmpi'
    'nsync'
    'abseil-cpp'
  )
  conflicts=('python-onnxruntime-cuda')
  replaces=('python-onnxruntime-cuda')
  pkgdesc+=' (CUDA execution provider)'

  cd build
  install -Dm755 libonnxruntime_providers_cuda.so -t "${pkgdir}/usr/lib"

  install -Ddm755 "${pkgdir}/usr/share/licenses"
  ln -s onnxruntime "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_onnxruntime-tensorrt() {
  depends=(
    'tensorrt'
#     'protobuf' 'libprotobuf.so'
    'nsync'
#     'flatbuffers'
  )
  pkgdesc+=' (TENSORRT execution provider)'

  cd build
  install -Dm755 libonnxruntime_providers_tensorrt.so -t "${pkgdir}/usr/lib"

  install -Ddm755 "${pkgdir}/usr/share/licenses"
  ln -s onnxruntime "${pkgdir}/usr/share/licenses/${pkgname}"
}
