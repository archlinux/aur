# Maintainer: Xin Xu <happyslowly@gmail.com>
pkgname=tensorflow-model-server-cuda-git
pkgver=1.10
pkgrel=1
pkgdesc="A flexible, high-performance serving system for machine learning models"
arch=("x86_64")
url="https://tensorflow.org/serving"
license=('Apache')
source=("git+https://github.com/tensorflow/serving.git")
makedepends=(git bazel gcc7 cuda cudnn)
depends=(gcc7-libs)
md5sums=('SKIP')
pkgver() {
    cd ${srcdir}/serving
    git branch -r | grep '/r' | cut -d'r' -f3 | sort --version-sort | tail -1
}
prepare() {
    export CUDA_TOOLKIT_PATH=/opt/cuda
    export CUDNN_INSTALL_PATH=/opt/cuda

    export TF_NEED_CUDA=1
    export TF_NEED_GCP=0
    export TF_NEED_JEMALLOC=1
    export TF_NEED_HDFS=0
    export TF_NEED_OPENCL=0
    export TF_NEED_MKL=0
    export TF_NEED_VERBS=0
    export TF_NEED_MPI=0
    export TF_NEED_GDR=0
    export TF_ENABLE_XLA=0
    export TF_CUDA_VERSION=$($CUDA_TOOLKIT_PATH/bin/nvcc --version  | sed -n 's/^.*release \(.*\),.*/\1/p')
    export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' $CUDNN_INSTALL_PATH/include/cudnn.h)
    export TF_CUDA_CLANG=0
    export TF_CUDA_COMPUTE_CAPABILITIES="3.0,3.5,5.2,6.1,6.2"
    export TF_NCCL_VERSION=1.3
    export GCC_HOST_COMPILER_PATH=$(which gcc-7)
    export PYTHON_BIN_PATH=$(which python)
    export CC_OPT_FLAGS="-march=native"
}
build() {
    cd ${srcdir}/serving
    git checkout r${pkgver}
    bazel build -c opt --config=cuda tensorflow_serving/model_servers:tensorflow_model_server
}
package() {
    conflicts=("tensorflow-model-server-git")

    install -Dm755 ${srcdir}/serving/bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server ${pkgdir}/usr/bin/tensorflow_model_server
    install -Dm644 ${srcdir}/serving/LICENSE ${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE
}
