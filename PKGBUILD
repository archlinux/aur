# Maintainer: Ryan Hirasaki <ryanhirasaki [plus] arch [at] gmail [dot] com>
pkgname=libtensorflow-lite
pkgver=2.3.1
pkgrel=2
pkgdesc="Tensorflow Lite - Library and Headers"
arch=('x86_64')
url='https://github.com/tensorflow/tensorflow'
license=('Apache')
depends=('gcc' 'flatbuffers')
makedepends=('bazel')
provides=('libtensorflow-lite')
source=("https://github.com/tensorflow/tensorflow/archive/v$pkgver.tar.gz")
sha256sums=('ee534dd31a811f7a759453567257d1e643f216d8d55a25c32d2fbfff8153a1ac')

build() {
	cd "tensorflow-$pkgver"
	echo "*" > .bazelversion
	./tensorflow/lite/tools/make/download_dependencies.sh
	bazel build //tensorflow/lite/c:libtensorflowlite_c.so # C Shared Library
	bazel build //tensorflow/lite:libtensorflowlite.so	   # C++ Shared library
	make -j `nproc` -C . -f tensorflow/lite/tools/make/Makefile # C++ Static Library
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
}
