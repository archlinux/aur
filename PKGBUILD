# Maintainer: Butui Hu <hot123tea123@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

pkgname=('python-pytorch-git' 'python-pytorch-mkl-git' 'python-pytorch-cuda-git' 'python-pytorch-mkl-cuda-git')
_pkgname='pytorch'
_pkgver=1.3.1
pkgver=1.3.1.r22820.1350b99de4
pkgrel=1
pkgdesc='Tensors and Dynamic neural networks in Python with strong GPU acceleration'
arch=('x86_64')
url='https://pytorch.org'
license=('BSD')
depends=(
  'ffmpeg'
  'gflags'
  'google-glog'
  'leveldb'
  'lmdb'
  'opencv'
  'openmp'
  'protobuf'
  'pybind11'
  'python-future'
  'python-numpy'
  'python-yaml'
  'qt5-base'
  'zeromq'
)
makedepends=(
  'cmake'
  'cuda'
  'cuda'
  'cudnn'
  'cudnn'
  'doxygen'
  'git'
  'magma'
  'nccl'
  'python-numpy'
  'python-setuptools'
  'python-yaml'
)
source=("${_pkgname}::git+https://github.com/pytorch/pytorch.git")
sha512sums=('SKIP')

get_pyver() {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ver=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "${_pkgver}.${ver}"
}

prepare() {
  cd "${_pkgname}"

  # This is the lazy way since pytorch has sooo many submodules and they keep
  # changing them around but we've run into more problems so far doing it the
  # manual than the lazy way. This lazy way (not explicitly specifying all
  # submodules) will make building inefficient but for now I'll take it.
  # It will result in the same package, don't worry.
  git submodule update --init --recursive

  # https://github.com/pytorch/pytorch/issues/26555
  sed -i 's#^  ${CMAKE_CURRENT_SOURCE_DIR}/tensor_iterator_test.cpp##g' aten/src/ATen/test/CMakeLists.txt

  # Fix build with Python 3.8
  # https://github.com/pytorch/pytorch/issues/28060
  find -name '*.cpp' -exec sed -i '/tp_print/s/nullptr/0/' {} +

  cd ..
  cp -a "${_pkgname}" "${_pkgname}-git"
  cp -a "${_pkgname}" "${_pkgname}-mkl-git"
  cp -a "${_pkgname}" "${_pkgname}-cuda-git"
  cp -a "${_pkgname}" "${_pkgname}-mkl-cuda-git"

  # Check tools/setup_helpers/cmake.py, setup.py and CMakeLists.txt for a list of flags that can be set via env vars.
  export BUILD_BINARY=ON
  export BUILD_CAFFE2_OPS=ON
  export BUILD_CUSTOM_PROTOBUF=OFF
  export BUILD_DOCS=ON
  export BUILDING_WITH_TORCH_LIBS=ON
  export BUILD_JNI=OFF
  export BUILD_NAMEDTENSOR=ON
  export BUILD_SHARED_LIBS=ON
  export BUILD_TEST=OFF
  export CAFFE2_STATIC_LINK_CUDA=OFF
  export CUDA_HOME=/opt/cuda
  export CUDAHOSTCXX=/opt/cuda/bin/g++
  export CUDNN_INCLUDE_DIR=/usr/include
  export CUDNN_LIB_DIR=/usr/lib
  export PYTORCH_BUILD_NUMBER=1
  export PYTORCH_BUILD_VERSION="${_pkgver}"
  # modify to your need, you don't need to compile for all GPU arch
  export TORCH_CUDA_ARCH_LIST="3.2;3.5;3.7;5.0;5.2;5.3;6.0;6.0+PTX;6.1;6.1+PTX;6.2;6.2+PTX;7.0;7.0+PTX;7.2;7.2+PTX;7.5;7.5+PTX"
  export TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
  export USE_CAFFE2_OPS=ON
  export USE_DISTRIBUTED=ON
  export USE_FBGEMM=OFF
  export USE_FFMPEG=ON
  export USE_GFLAGS=ON
  export USE_GLOG=ON
  export USE_GLOO=ON
  export USE_LEVELDB=ON
  export USE_LITE_PROTO=OFF
  export USE_LMDB=ON
  export USE_NATIVE_ARCH=ON
  export USE_NNPACK=ON
  export USE_NUMPY=ON
  export USE_NVRTC=ON
  export USE_OPENCV=ON
  export USE_OPENMP=ON
  export USE_QNNPACK=ON
  export USE_ROCM=OFF
  export USE_STATIC_NCCL=OFF
  export USE_SYSTEM_EIGEN_INSTALL=ON
  export USE_SYSTEM_NCCL=ON
  export USE_TBB=ON
  export USE_ZMQ=ON
  export USE_ZSTD=ON
  export VERBOSE=1
}

build() {
  echo "Building without cuda and without MKL-DNN"
  export USE_CUDA=OFF
  export USE_CUDNN=OFF
  export USE_MKLDNN_CBLAS=OFF
  export USE_MKLDNN=OFF
  export USE_NCCL=OFF

  cd "${srcdir}/${_pkgname}-git"
  python setup.py build


  echo "Building without cuda and with MKL-DNN"
  export USE_CUDA=OFF
  export USE_CUDNN=OFF
  export USE_MKLDNN_CBLAS=ON
  export USE_MKLDNN=ON
  export USE_NCCL=OFF
  cd "${srcdir}/${_pkgname}-mkl-git"
  python setup.py build


  echo "Building with cuda and without MKL-DNN"
  export USE_CUDA=ON
  export USE_CUDNN=ON
  export USE_MKLDNN_CBLAS=OFF
  export USE_MKLDNN=OFF
  export USE_NCCL=ON
  cd "${srcdir}/${_pkgname}-cuda-git"
  python setup.py build


  echo "Building with cuda and with MKL-DNN"
  export USE_CUDA=ON
  export USE_CUDNN=ON
  export USE_MKLDNN_CBLAS=ON
  export USE_MKLDNN=ON
  export USE_NCCL=ON
  cd "${srcdir}/${_pkgname}-mkl-cuda-git"
  python setup.py build
}

_package() {
  # Prevent setup.py from re-running CMake and rebuilding
  sed -e 's/RUN_BUILD_DEPS = True/RUN_BUILD_DEPS = False/g' -i setup.py

  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  pytorchpath="usr/lib/python$(get_pyver)/site-packages/torch"
  install -d "${pkgdir}/usr/lib"

  # put CMake files in correct place
  mv "${pkgdir}/${pytorchpath}/share/cmake" "${pkgdir}/usr/lib/cmake"

  # put C++ API in correct place
  mv "${pkgdir}/${pytorchpath}/include" "${pkgdir}/usr/include"
  mv "${pkgdir}/${pytorchpath}/lib"/*.so* "${pkgdir}/usr/lib/"

  # clean up duplicates
  # TODO: move towards direct shared library dependecy of:
  #   c10, caffe2, libcpuinfo, CUDA RT, gloo, GTest, Intel MKL,
  #   NVRTC, ONNX, protobuf, libthreadpool, QNNPACK
  rm -rf "${pkgdir}/usr/include/pybind11"

  # python module is hardcoded to look there at runtime
  ln -s /usr/include "${pkgdir}/${pytorchpath}/include"
  find "${pkgdir}"/usr/lib -type f -name "*.so*" -print0 | while read -rd $'\0' _lib; do
    ln -s ${_lib#"$pkgdir"} "${pkgdir}/${pytorchpath}/lib/"
  done
}

package_python-pytorch-git() {
  cd "${srcdir}/${_pkgname}-git"
  _package
}

package_python-pytorch-mkl-git() {
  pkgdesc='Tensors and Dynamic neural networks in Python with strong GPU acceleration (with MKL-DNN)'
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver})

  cd "${srcdir}/${_pkgname}-mkl-git"
  _package
}

package_python-pytorch-cuda-git() {
  pkgdesc='Tensors and Dynamic neural networks in Python with strong GPU acceleration (with CUDA)'
  depends+=(
    'cuda'
    'cudnn'
    'magma'
    'nccl'
)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver})

  cd "${srcdir}/${_pkgname}-cuda-git"
  _package
}

package_python-pytorch-mkl-cuda-git() {
  pkgdesc='Tensors and Dynamic neural networks in Python with strong GPU acceleration (with CUDA and MKL-DNN)'
  depends+=(
    'cuda'
    'cudnn'
    'magma'
    'nccl'
)
  conflicts=(python-pytorch)
  provides=(python-pytorch=${pkgver} python-pytorch-cuda=${pkgver})

  cd "${srcdir}/${_pkgname}-mkl-cuda-git"
  _package
}

# vim:set ts=2 sw=2 et:
