# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

pkgbase="python-pytorch"
pkgname=("python-pytorch" "python-pytorch-cuda")
_pkgname="pytorch"
pkgver=1.0.0
pkgrel=5
pkgdesc="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD')
depends=('python' 'python-yaml' 'python-numpy' 'opencv' 'nccl')
makedepends=('python' 'python-setuptools' 'python-yaml' 'python-numpy' 'cmake' 'cuda' 'cudnn' 'git')
source=("${_pkgname}-${pkgver}::git+https://github.com/pytorch/pytorch.git#tag=v$pkgver"
        "git+https://github.com/catchorg/Catch2"
        "git+https://github.com/pybind/pybind11"
        "git+https://github.com/NVlabs/cub"
        "git+https://github.com/eigenteam/eigen-git-mirror"
        "git+https://github.com/google/googletest"
        "git+https://github.com/NervanaSystems/nervanagpu"
        "git+https://github.com/google/benchmark"
        "git+https://github.com/google/protobuf"
        "git+https://github.com/Yangqing/ios-cmake"
        "git+https://github.com/Maratyszcza/NNPACK"
        "git+https://github.com/facebookincubator/gloo"
        "git+https://github.com/Maratyszcza/pthreadpool"
        "git+https://github.com/Maratyszcza/FXdiv"
        "git+https://github.com/Maratyszcza/FP16"
        "git+https://github.com/Maratyszcza/psimd"
        "git+https://github.com/facebook/zstd"
        "git+https://github.com/Maratyszcza/cpuinfo"
        "git+https://github.com/PeachPy/enum34"
        "git+https://github.com/Maratyszcza/PeachPy"
        "git+https://github.com/benjaminp/six"
        "git+https://github.com/ARM-software/ComputeLibrary"
        "git+https://github.com/onnx/onnx"
        "git+https://github.com/USCILab/cereal"
        "git+https://github.com/onnx/onnx-tensorrt"
        "git+https://github.com/shibatch/sleef"
        "git+https://github.com/intel/ideep")
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
            'SKIP'
            'SKIP')

prepare() {
  cd "${_pkgname}-${pkgver}"

  git submodule init
  git config submodule."third_party/catch".url "${srcdir}"/Catch2
  git config submodule."third_party/pybind11".url "${srcdir}"/pybind11
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
  git config submodule."third_party/cereal".url "${srcdir}"/cereal
  git config submodule."third_party/onnx-tensorrt".url "${srcdir}"/onnx-tensorrt
  git config submodule."third_party/sleef".url "${srcdir}"/sleef
  git config submodule."third_party/ideep".url "${srcdir}"/ideep
  git submodule update

  cd ..

  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-cuda"
}

build() {
  # Uncomment and modify the following line to enable Intel MKL and magma support
  # export CMAKE_PREFIX_PATH=/opt/intel/mkl/include:/opt/intel/mkl/lib/intel64:/opt/magma \
  export CC=gcc-7
  export CXX=g++-7

  echo "Building without cuda"
  export NO_CUDA=1
  export WITH_CUDNN=0
  export USE_OPENCV=1
  export BUILD_BINARY=1

  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build

  echo "Building with cuda"
  export NO_CUDA=0
  export WITH_CUDNN=1
  export CUDAHOSTCXX=g++-7
  export CUDA_HOME=/opt/cuda
  export CUDNN_LIB_DIR=/usr/lib
  export CUDNN_INCLUDE_DIR=/usr/include
  export TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
  export TORCH_CUDA_ARCH_LIST="3.0;3.2;3.5;3.7;5.0;5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5"

  cd "$srcdir/${_pkgname}-${pkgver}-cuda"
  python setup.py build
}

package_python-pytorch() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python-pytorch-cuda() {
  depends+=('cuda' 'cudnn')
  provides=('python-pytorch')
  conflicts=('python-pytorch')
  cd "$srcdir/${_pkgname}-${pkgver}-cuda"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
