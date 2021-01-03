# Maintainer: Ryan Hirasaki <ryanhirasaki [plus] arch [at] gmail [dot] com>
pkgname=libtensorflow-lite
pkgver=2.4.0
pkgrel=1
pkgdesc="Tensorflow Lite - Library and Headers. C/C++ & Python"
arch=('x86_64')
url='https://github.com/tensorflow/tensorflow'
license=('Apache')
depends=('gcc' 'flatbuffers' 'pybind11' 'tensorflow')
makedepends=('bazel' 'python-setuptools' 'git' 'python-numpy')
provides=('libtensorflow-lite')
source=("https://github.com/tensorflow/tensorflow/archive/v$pkgver.tar.gz")
sha256sums=('26c833b7e1873936379e810a39d14700281125257ddda8cd822c89111db6f6ae')

prepare() {
	cd "tensorflow-$pkgver"
	echo "*" > .bazelversion

	# Fetch Build only sources
	./tensorflow/lite/tools/make/download_dependencies.sh

	# Setup python enviorment
	TENSORFLOW_LITE_DIR="./tensorflow/lite"
	BUILD_DIR="$TENSORFLOW_LITE_DIR/tools/pip_package/gen/tflite_pip/python3"
	rm -rf "${BUILD_DIR}" && mkdir -p "${BUILD_DIR}/tflite_runtime"
	cp -r "${TENSORFLOW_LITE_DIR}/tools/pip_package/debian" \
		"${TENSORFLOW_LITE_DIR}/tools/pip_package/setup.py" \
		"${TENSORFLOW_LITE_DIR}/tools/pip_package/MANIFEST.in" \
		"${TENSORFLOW_LITE_DIR}/python/interpreter_wrapper" \
		"${BUILD_DIR}"
	cp "${TENSORFLOW_LITE_DIR}/python/interpreter.py" \
		"${BUILD_DIR}/tflite_runtime"
}

build() {
	cd "tensorflow-$pkgver"
	bazel build //tensorflow/lite/c:libtensorflowlite_c.so # C Shared Library
	bazel build //tensorflow/lite:libtensorflowlite.so	 # C++ Shared library
	make -j `nproc` -C . -f tensorflow/lite/tools/make/Makefile # C++ Static Library
	cd ./tensorflow/lite/tools/pip_package/gen/tflite_pip/python3
		export PACKAGE_VERSION="$pkgver"
		export TENSORFLOW_DIR="$srcdir/tensorflow-$pkgver/"
		python setup.py build
	cd -
}

package() {
	cd "tensorflow-$pkgver"
	
	ARCH=$(uname -m)
	mkdir -p $pkgdir/usr/lib/
	install -C bazel-bin/tensorflow/lite/libtensorflowlite.so "$pkgdir/usr/lib"	
	install -C bazel-bin/tensorflow/lite/c/libtensorflowlite_c.so "$pkgdir/usr/lib"	
	install -C tensorflow/lite/tools/make/gen/linux_$ARCH/lib/libtensorflow-lite.a "$pkgdir/usr/lib"
	
	cd tensorflow/lite/
	HEADERS=$(find . -name \*.h)
	for HEADER in $HEADERS
	do
		BASEDIR=$(dirname "$HEADER")
		HEADER=$(echo "$HEADER" | sed 's/.\///')
		mkdir -p "$pkgdir/usr/include/tensorflow/lite/$BASEDIR"
		install -C "$HEADER" "$pkgdir/usr/include/tensorflow/lite/$BASEDIR"
	done

	cd ./tools/pip_package/gen/tflite_pip/python3
		python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	cd -
}
