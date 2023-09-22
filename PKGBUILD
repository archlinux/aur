# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib-cuda
pkgver=0.4.16
pkgrel=4
pkgdesc='XLA library for JAX'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
groups=('jax')
depends=('absl-py'
         'cuda'
         'cudnn'
         'python-flatbuffers'
         'python-ml-dtypes'
         'python-numpy'
         'python-scipy')
makedepends=('bazel' 'gcc12' 'pybind11' 'python-build' 'python-installer'
             'python-setuptools' 'python-wheel')
conflicts=('python-jaxlib')
provides=("python-jaxlib=$pkgver")
source=("jaxlib-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jaxlib-v${pkgver}.tar.gz"
        'bazelrc.user')
sha256sums=('85c8bc050abe0a2cf62e8cfc7edb4904dd3807924b5714ec6277f291c576b5ca'
            '07da4c3594dad382ee02748b860c629ffa083ba37ad22a892291bdc72efbac5e')

prepare() {
    # Allow any bazel version
    echo "*" > jax-jaxlib-v${pkgver}/.bazelversion

    # Add specific bazel's options.
    cp bazelrc.user jax-jaxlib-v${pkgver}/.bazelrc.user

    # These environment variables influence the behavior of the configure call below.
    export PYTHON_BIN_PATH=/usr/bin/python
    export USE_DEFAULT_PYTHON_LIB_PATH=1
    export TF_NEED_JEMALLOC=1
    # See https://github.com/openxla/xla/blob/main/configure.py
    # There is some vague reason why we should exclude pybind11. It exists in
    # two version in source tree: abseil one and bazel one.
    export TF_SYSTEM_LIBS="boringssl,curl,cython,gif,icu,libjpeg_turbo,lmdb,nasm,png,zlib"
    export TF_SET_ANDROID_WORKSPACE=0
    export TF_DOWNLOAD_CLANG=0
    export TF_NCCL_VERSION=$(pkg-config nccl --modversion | grep -Po '\d+\.\d+')
    export TF_IGNORE_MAX_BAZEL_VERSION=1
    export NCCL_INSTALL_PATH=/usr
    # Does tensorflow really need the compiler overridden in 5 places? Yes.
    export CC=gcc
    export CXX=g++
    # For some reason, simlink is not resolved.
    export GCC_HOST_COMPILER_PATH=/usr/bin/gcc-12
    export HOST_C_COMPILER=/usr/bin/${CC}
    export HOST_CXX_COMPILER=/usr/bin/${CXX}
    export TF_CUDA_CLANG=0  # Clang currently disabled because it's not compatible at the moment.
    export CLANG_CUDA_COMPILER_PATH=/usr/bin/clang
    export TF_CUDA_PATHS=/opt/cuda,/usr/lib,/usr
    export TF_CUDA_VERSION=$(/opt/cuda/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
    export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' /usr/include/cudnn_version.h)
    # https://github.com/tensorflow/tensorflow/blob/1ba2eb7b313c0c5001ee1683a3ec4fbae01105fd/third_party/gpus/cuda_configure.bzl#L411-L446
    # according to the above, we should be specifying CUDA compute capabilities as 'sm_XX' or 'compute_XX' from now on
    # add latest PTX for future compatibility
    # Valid values can be discovered from nvcc --help
    export TF_CUDA_COMPUTE_CAPABILITIES=sm_70,sm_72,sm_75,sm_80,sm_86,sm_87,sm_89,sm_90,compute_90

    # Override default version.
    export JAXLIB_RELEASE=$pkgver
}


build() {
    cd $srcdir/jax-jaxlib-v$pkgver
    bazel run --action_env=JAXLIB_RELEASE --verbose_failures=true \
        //jaxlib/tools:build_wheel -- --cpu x86_64 --output_path=$PWD/dist
}

package() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/jax-jaxlib-v$pkgver/dist/jaxlib-$pkgver-*.whl
}
