# Maintainer: Ryan Hirasaki <ryanhirasaki [plus] arch [at] gmail [dot] com>
pkgname=libtensorflow-lite
pkgver=2.3.1
pkgrel=1
pkgdesc="Tensorflow Lite - Library and Headers"
arch=('x86_64')
url='https://github.com/tensorflow/tensorflow'
license=('Apache')
depends=('gcc' 'flatbuffers')
provides=('libtensorflow-lite')
source=("https://github.com/tensorflow/tensorflow/archive/v$pkgver.tar.gz")
sha256sums=('ee534dd31a811f7a759453567257d1e643f216d8d55a25c32d2fbfff8153a1ac')

build() {
	cd "tensorflow-$pkgver"
	./tensorflow/lite/tools/make/download_dependencies.sh
	./tensorflow/lite/tools/make/build_lib.sh
}

package() {
	cd "tensorflow-$pkgver"
	
	

	mkdir -p $pkgdir/usr/lib/
	install -C tensorflow/lite/tools/make/gen/linux_x86_64/lib/libtensorflow-lite.a "$pkgdir/usr/lib"
	
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
