# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

pkgbase="python-pytorch"
pkgname=("python-pytorch" "python-pytorch-opt" "python-pytorch-cuda" "python-pytorch-opt-cuda")
_pkgname="pytorch"
pkgver=1.1.0
pkgrel=2
pkgdesc="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD')
depends=('google-glog' 'gflags' 'opencv' 'openmp' 'nccl' 'pybind11' 'python' 'python-yaml' 'python-numpy' 'protobuf')
makedepends=('python' 'python-setuptools' 'python-yaml' 'python-numpy' 'cmake' 'cuda' 'cudnn' 'git')
source=("${_pkgname}-${pkgver}::git+https://github.com/pytorch/pytorch.git#tag=v$pkgver")
sha256sums=('SKIP')

get_pyver () {
    python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

prepare() {
  cd "${_pkgname}-${pkgver}"

  # This is the lazy way since pytorch has sooo many submodules and they keep
  # changing them around but we've run into more problems so far doing it the
  # manual than the lazy way. This lazy way (not explicitly specifying all
  # submodules) will make building inefficient but for now I'll take it.
  # It will result in the same package, don't worry.
  git submodule update --init --recursive

  cd ..

  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-opt"
  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-cuda"
  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-opt-cuda"

  export CC=gcc
  export CXX=g++
  export PYTORCH_BUILD_VERSION="${pkgver}"
  export PYTORCH_BUILD_NUMBER=1
  export USE_MKLDNN=0
  # export BUILD_CUSTOM_PROTOBUF=0
  # export BUILD_SHARED_LIBS=0
  export USE_GFLAGS=1
  export USE_GLOG=1
  export BUILD_BINARY=1
  export USE_OPENCV=1
  export USE_SYSTEM_NCCL=1
}

build() {
  echo "Building without cuda and without non-x86-64 optimizations"
  export NO_CUDA=1
  export WITH_CUDNN=0

  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i "s/march=native/march=x86-64/g" cmake/MiscCheck.cmake
  python setup.py build


  echo "Building without cuda and with non-x86-64 optimizations"
  export NO_CUDA=1
  export WITH_CUDNN=0

  cd "${srcdir}/${_pkgname}-${pkgver}-opt"
  sed -i "s/march=native/march=haswell/g" cmake/MiscCheck.cmake
  python setup.py build


  echo "Building with cuda and without non-x86-64 optimizations"
  export NO_CUDA=0
  export WITH_CUDNN=1
  export CUDAHOSTCXX=g++
  export CUDA_HOME=/opt/cuda
  export CUDNN_LIB_DIR=/usr/lib
  export CUDNN_INCLUDE_DIR=/usr/include
  export TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
  export TORCH_CUDA_ARCH_LIST="3.0;3.2;3.5;3.7;5.0;5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5"

  cd "${srcdir}/${_pkgname}-${pkgver}-cuda"
  sed -i "s/march=native/march=x86-64/g" cmake/MiscCheck.cmake
  python setup.py build


  echo "Building with cuda and without non-x86-64 optimizations"
  export NO_CUDA=0
  export WITH_CUDNN=1
  export CUDAHOSTCXX=g++
  export CUDA_HOME=/opt/cuda
  export CUDNN_LIB_DIR=/usr/lib
  export CUDNN_INCLUDE_DIR=/usr/include
  export TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
  export TORCH_CUDA_ARCH_LIST="3.0;3.2;3.5;3.7;5.0;5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5"

  cd "${srcdir}/${_pkgname}-${pkgver}-opt-cuda"
  sed -i "s/march=native/march=haswell/g" cmake/MiscCheck.cmake
  python setup.py build
}

_package() {
  # Prevent setup.py from re-running CMake and rebuilding
  sed -e 's/RUN_BUILD_DEPS = True/RUN_BUILD_DEPS = False/g' -i setup.py

  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  # put CMake files in correct place
  install -d "${pkgdir}/usr/lib/cmake"
  pytorchpath="usr/lib/python$(get_pyver)/site-packages/torch"
  mv "${pkgdir}/${pytorchpath}/share/cmake"/* \
     "${pkgdir}/usr/lib/cmake/"

  # put C++ API in correct place
  install -d "${pkgdir}/usr/include"
  install -d "${pkgdir}/usr/lib/pytorch"
  mv "${pkgdir}/${pytorchpath}/include"/* "${pkgdir}/usr/include/"
  mv "${pkgdir}/${pytorchpath}/lib"/*.so* "${pkgdir}/usr/lib/pytorch/"

  # clean up duplicates
  # TODO: move towards direct shared library dependecy of:
  #   c10, caffe2, libcpuinfo, CUDA RT, gloo, GTest, Intel MKL,
  #   NVRTC, ONNX, protobuf, libthreadpool, QNNPACK
  rm -rf "${pkgdir}/${pytorchpath}/share/cmake"
  rm -rf "${pkgdir}/${pytorchpath}/include"
  rm -rf "${pkgdir}/usr/include/pybind11"

  # python module is hardcoded to look there at runtime
  ln -s /usr/include "${pkgdir}/${pytorchpath}/include"
  find "${pkgdir}"/usr/lib/pytorch -type f -name "*.so*" -print0 | while read -rd $'\0' _lib; do
    ln -s ${_lib#"$pkgdir"} "${pkgdir}/${pytorchpath}/lib/"
  done

  # ldconfig
  install -d "${pkgdir}/etc/ld.so.conf.d"
  echo '/usr/lib/pytorch' > "${pkgdir}/etc/ld.so.conf.d/pytorch.conf"
}

package_python-pytorch() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  _package
}

package_python-pytorch-opt() {
  cd "${srcdir}/${_pkgname}-${pkgver}-opt"
  _package
}

package_python-pytorch-cuda() {
  depends+=('cuda' 'cudnn')
  provides=('python-pytorch')
  conflicts=('python-pytorch')

  cd "${srcdir}/${_pkgname}-${pkgver}-cuda"
  _package
}

package_python-pytorch-opt-cuda() {
  depends+=('cuda' 'cudnn')
  provides=('python-pytorch')
  conflicts=('python-pytorch')

  cd "${srcdir}/${_pkgname}-${pkgver}-opt-cuda"
  _package
}

# vim:set ts=2 sw=2 et:
