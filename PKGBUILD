# Maintainer: Jingbei Li <i@jingbei.li>
# Contributor: Xin Xu <happyslowly@gmail.com>
pkgname=tensorflow-model-server-cuda
pkgver=1.11.0
pkgrel=1
pkgdesc="A flexible, high-performance serving system for machine learning models"
arch=("x86_64")
url="https://tensorflow.org/serving"
license=('Apache')
source=("https://github.com/tensorflow/serving/archive/$pkgver.tar.gz")
makedepends=(bazel cuda cudnn nccl python)
conflicts=("tensorflow-model-server")
depends=(gcc7-libs)
md5sums=('SKIP')

prepare() {
    export CUDA_TOOLKIT_PATH=/opt/cuda
    export CUDNN_INSTALL_PATH=/opt/cuda
    export NCCL_INSTALL_PATH=/usr
    export TF_NEED_CUDA=1
    export TF_CUDA_VERSION=$(nvcc --version  | sed -n 's/^.*release \(.*\),.*/\1/p')
    export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' $CUDNN_INSTALL_PATH/include/cudnn.h)
    export TF_CUDA_COMPUTE_CAPABILITIES="3.0,3.5,5.2,6.1,6.2"
    export TF_NCCL_VERSION=2.3.5
    export GCC_HOST_COMPILER_PATH=/usr/bin/gcc-7
    export PYTHON_BIN_PATH=/usr/bin/python
}
build() {
    cd ${srcdir}/serving-$pkgver
    bazel build -c opt --config=cuda tensorflow_serving/model_servers:tensorflow_model_server
}
package() {
    cd ${srcdir}/serving-$pkgver
    install -Dm755 bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server ${pkgdir}/usr/bin/tensorflow_model_server
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
