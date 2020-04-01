# Maintainer: piernov <piernov@piernov.org>

pkgname=python-tensorflow-model-optimization-git
pkgver=r327.c791831
pkgrel=1
pkgdesc="A toolkit to optimize ML models for deployment for Keras and TensorFlow, including quantization and pruning."
url="https://github.com/tensorflow/model-optimization"
arch=('x86_64')
license=('APACHE')
conflicts=('python-tensorflow-model-optimization')
provides=('python-tensorflow-model-optimization')
depends=('python-tensorflow' 'python-numpy' 'python-six' 'python-scipy' 'python-mock' 'python-dm-tree')
makedepends=('python-setuptools' 'bazel')
source=("git+https://github.com/tensorflow/model-optimization.git")
sha256sums=('SKIP')

pkgver() {
	cd model-optimization
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# Force OpenJDK-11 
	export JAVA_HOME=/usr/lib/jvm/java-11-openjdk 

	cd model-optimization
	bazel build --copt=-O3 --copt=-march=native :pip_pkg
	./bazel-bin/pip_pkg .
}

package() {
	cd model-optimization
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps tf_model_optimization*.whl
}
