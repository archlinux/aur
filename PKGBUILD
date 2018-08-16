# Maintainer: Xin Xu <happyslowly@gmail.com>
pkgname=tensorflow-model-server-git
pkgver=1.10
pkgrel=1
pkgdesc="A flexible, high-performance serving system for machine learning models"
arch=("x86_64")
url="https://tensorflow.org/serving"
license=('Apache')
source=("git+https://github.com/tensorflow/serving.git")
makedepends=(git bazel gcc)
depends=(gcc-libs)
md5sums=('SKIP')
pkgver() {
    cd ${srcdir}/serving
    git branch -r | grep '/r' | cut -d'r' -f3 | sort --version-sort | tail -1
}
build() {
    cd ${srcdir}/serving
    git checkout r${pkgver}
    bazel build -c opt tensorflow_serving/model_servers:tensorflow_model_server
}
package() {
    conflicts=("tensorflow-model-server-cuda-git")

    install -Dm755 ${srcdir}/serving/bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server ${pkgdir}/usr/bin/tensorflow_model_server
    install -Dm644 ${srcdir}/serving/LICENSE ${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE
}
