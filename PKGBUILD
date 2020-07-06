# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=torchvision-cuda
pkgdesc='datasets, transforms, and models specific to computer vision (C++ library only)'
pkgver=0.6.1
pkgrel=1
license=("BSD")
url='https://github.com/pytorch/vision'
arch=('x86_64')

provides=(torchvision)
conflicts=(torchvision)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/pytorch/vision/archive/v$pkgver.tar.gz"
)

sha512sums=('428235ae9412d176dc62eb42ed926caa5199bab448e7798fa240d69c1337e1ca5423c45a34bd6f4527e7ccafb927f53743311f8701dcee5f168bacc60f1d6750')

depends=(
	cuda
	cudnn
	python-pytorch-cuda
)

makedepends=(
	cmake
)

prepare() {
	rm -rf build
	mkdir build
	cd build

	cmake "../vision-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS} -O3" \
		-DWITH_CUDA=ON \
		-DTORCH_CUDA_ARCH_LIST="3.5;3.7;5.0;5.2;5.3;6.0;6.0+PTX;6.1;6.1+PTX;6.2;6.2+PTX;7.0;7.0+PTX;7.2;7.2+PTX;7.5;7.5+PTX"
}

build() {
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "vision-$pkgver/LICENSE"
}
