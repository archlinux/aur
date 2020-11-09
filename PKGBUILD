# Maintainer: Ryan Hirasaki <ryanhirasaki [plus] arch [at] gmail [dot] com>
pkgname=libtensorflow-lite
pkgver=2.3.1
pkgrel=5
pkgdesc="Tensorflow Lite - Library and Headers. C/C++ & Python"
arch=('x86_64')
url='https://github.com/tensorflow/tensorflow'
license=('Apache')
depends=('gcc' 'flatbuffers')
makedepends=('bazel' 'python-setuptools')
provides=('libtensorflow-lite')
source=("https://github.com/tensorflow/tensorflow/archive/v$pkgver.tar.gz")
sha256sums=('ee534dd31a811f7a759453567257d1e643f216d8d55a25c32d2fbfff8153a1ac')

prepare() {
	cd "tensorflow-$pkgver"
	echo "*" > .bazelversion

	# Fetch Build only sources
	bazel fetch //tensorflow/lite:libtensorflowlite.so
	bazel fetch //tensorflow/lite/c:libtensorflowlite_c.so
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
	bazel build --nofetch //tensorflow/lite/c:libtensorflowlite_c.so # C Shared Library
	bazel build --nofetch //tensorflow/lite:libtensorflowlite.so	 # C++ Shared library
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
