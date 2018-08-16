# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

pkgbase="python-pytorch"
pkgname=("python-pytorch" "python2-pytorch" "python-pytorch-cuda" "python2-pytorch-cuda")
_pkgname="pytorch"
_commit=a24163a
pkgver=0.4.1
pkgrel=5
pkgdesc="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools'
             'python-yaml' 'python2-yaml' 'python-numpy' 'python2-numpy'
             'cmake' 'cuda' 'cudnn' 'git' 'python2-typing')
source=("${_pkgname}-${pkgver}::git+https://github.com/pytorch/pytorch.git#commit=$_commit"
        "git+https://github.com/catchorg/Catch2"
        "git+https://github.com/ARM-software/ComputeLibrary"
        "git+https://github.com/Maratyszcza/FP16"
        "git+https://github.com/Maratyszcza/FXdiv"
        "git+https://github.com/Maratyszcza/NNPACK"
        "git+https://github.com/google/benchmark"
        "git+https://github.com/Maratyszcza/cpuinfo"
        "git+https://github.com/NVlabs/cub"
        "git+https://github.com/eigenteam/eigen-git-mirror"
        "git+https://github.com/facebookincubator/gloo"
        "git+https://github.com/google/googletest"
        "git+https://github.com/Yangqing/ios-cmake"
        "git+https://github.com/nanopb/nanopb"
        "git+https://github.com/NervanaSystems/nervanagpu"
        "git+https://github.com/nvidia/nccl"
        "git+https://github.com/onnx/onnx"
        "git+https://github.com/google/protobuf"
        "git+https://github.com/Maratyszcza/psimd"
        "git+https://github.com/Maratyszcza/pthreadpool"
        "git+https://github.com/pybind/pybind11"
        "git+https://github.com/PeachPy/enum34"
        "git+https://github.com/Maratyszcza/PeachPy"
        "git+https://github.com/benjaminp/six"
        "git+https://github.com/facebook/zstd"
        noplt.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8e845663abbbd78bd4d3fcb8997b85c644a09470b166ed3a95429636670eb4ef')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}"/noplt.patch

  git submodule init
  git config submodule."third-party/cpuinfo".url "${srcdir}"/cpuinfo
  git config submodule."third_party/catch".url "${srcdir}"/Catch2
  git config submodule."third_party/nanopb".url "${srcdir}"/nanopb
  git config submodule."third_party/pybind11".url "${srcdir}"/pybind11
  git config submodule."third_party/nccl".url "${srcdir}"/nccl
  git config submodule."third_party/cub".url "${srcdir}"/cub
  git config submodule."third_party/eigen".url "${srcdir}"/eigen-git-mirror
  git config submodule."third_party/googletest".url "${srcdir}"/googletest
  git config submodule."third_party/nervanagpu".url "${srcdir}"/nervanagpu
  git config submodule."third_party/benchmark".url "${srcdir}"/benchmark
  git config submodule."third_party/protobuf".url "${srcdir}"/protobuf
  git config submodule."third_party/ios-cmake".url "${srcdir}"/ios-cmake
  git config submodule."third_party/NNPACK".url "${srcdir}"/NNPACK
  git config submodule."third_party/gloo".url "${srcdir}"/gloo
  git config submodule."third_party/NNPACK_deps/pthread_ool".url "${srcdir}"/pthreadpool
  git config submodule."third_party/NNPACK_deps/FXdiv".url "${srcdir}"/FXdiv
  git config submodule."third_party/NNPACK_deps/FP16".url "${srcdir}"/FP16
  git config submodule."third_party/NNPACK_deps/psimd".url "${srcdir}"/psimd
  git config submodule."third_party/zstd".url "${srcdir}"/zstd
  git config submodule."third_party/cpuinfo".url "${srcdir}"/cpuinfo
  git config submodule."third_party/python-enum".url "${srcdir}"/enum34
  git config submodule."third_party/python-peachpy".url "${srcdir}"/PeachPy
  git config submodule."third_party/python-six".url "${srcdir}"/six
  git config submodule."third_party/ComputeLibrary".url "${srcdir}"/ComputeLibrary
  git config submodule."third_party/onnx".url "${srcdir}"/onnx
  git submodule update

  cd ..

  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py3"
  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2-cuda"
  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py3-cuda"
}

build() {
  msg2 "Building Python 2 without cuda"
  cd "$srcdir/${_pkgname}-${pkgver}-py2"
  # Uncomment and modify the following line to enable Intel MKL and magma support
  #CMAKE_PREFIX_PATH=/opt/intel/mkl/include:/opt/intel/mkl/lib/intel64:/opt/magma \
  CFLAGS="${CFLAGS/-fno-plt/}" \
  CXXFLAGS="${CXXFLAGS/-fno-plt/}" \
  NO_CUDA=1 \
  WITH_CUDA=0 \
  WITH_CUDNN=0 \
  python2 setup.py build

  msg2 "Building Python 3 without cuda"
  cd "$srcdir/${_pkgname}-${pkgver}-py3"
  # Uncomment and modify the following line to enable Intel MKL and magma support
  #CMAKE_PREFIX_PATH=/opt/intel/mkl/include:/opt/intel/mkl/lib/intel64:/opt/magma \
  CFLAGS="${CFLAGS/-fno-plt/}" \
  CXXFLAGS="${CXXFLAGS/-fno-plt/}" \
  NO_CUDA=1 \
  WITH_CUDA=0 \
  WITH_CUDNN=0 \
  python setup.py build

  msg2 "Building Python 2 with cuda"
  cd "$srcdir/${_pkgname}-${pkgver}-py2-cuda"
  # Uncomment and modify the following line to enable Intel MKL and magma support
  #CMAKE_PREFIX_PATH=/opt/intel/mkl/include:/opt/intel/mkl/lib/intel64:/opt/magma \
  CFLAGS="${CFLAGS/-fno-plt/}" \
  CXXFLAGS="${CXXFLAGS/-fno-plt/}" \
  CC=gcc-7 \
  CXX=g++-7 \
  WITH_CUDA=1 \
  CUDA_HOME=/opt/cuda \
  WITH_CUDNN=1 \
  CUDNN_LIB_DIR=/opt/cuda/lib64 \
  CUDNN_INCLUDE_DIR=/opt/cuda/include \
  TORCH_NVCC_FLAGS="-D__CUDA_NO_HALF_OPERATORS__" \
  python2 setup.py build

  msg2 "Building Python 3 with cuda"
  cd "$srcdir/${_pkgname}-${pkgver}-py3-cuda"
  # Uncomment and modify the following line to enable Intel MKL and magma support
  #CMAKE_PREFIX_PATH=/opt/intel/mkl/include:/opt/intel/mkl/lib/intel64:/opt/magma \
  CFLAGS="${CFLAGS/-fno-plt/}" \
  CXXFLAGS="${CXXFLAGS/-fno-plt/}" \
  CC=gcc-7 \
  CXX=g++-7 \
  WITH_CUDA=1 \
  CUDA_HOME=/opt/cuda \
  WITH_CUDNN=1 \
  CUDNN_LIB_DIR=/opt/cuda/lib64 \
  CUDNN_INCLUDE_DIR=/opt/cuda/include \
  TORCH_NVCC_FLAGS="-D__CUDA_NO_HALF_OPERATORS__" \
  python setup.py build
}

package_python2-pytorch() {
  depends+=('python2' 'python2-yaml' 'python2-numpy' 'python2-typing')
  cd "$srcdir/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python-pytorch() {
  depends+=('python' 'python-yaml' 'python-numpy')
  cd "$srcdir/${_pkgname}-${pkgver}-py3"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-pytorch-cuda() {
  depends+=('python2' 'python2-yaml' 'python2-numpy' 'cuda' 'cudnn' 'python2-typing')
  provides=('python2-pytorch')
  conflicts=('python2-pytorch')
  cd "$srcdir/${_pkgname}-${pkgver}-py2-cuda"
  python2 setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python-pytorch-cuda() {
  depends+=('python' 'python-yaml' 'python-numpy' 'cuda' 'cudnn')
  provides=('python-pytorch')
  conflicts=('python-pytorch')
  cd "$srcdir/${_pkgname}-${pkgver}-py3-cuda"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
