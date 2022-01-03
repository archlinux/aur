# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=torchvision-cuda
pkgdesc='datasets, transforms, and models specific to computer vision (C++ library only)'
pkgver=0.11.2
pkgrel=1
license=("BSD")
url='https://github.com/pytorch/vision'
arch=('x86_64')

provides=(torchvision)
conflicts=(torchvision)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/pytorch/vision/archive/v$pkgver.tar.gz"
)

sha512sums=('11891d19c1a17d27fbcc95b576a7bba7d2d2b96673661bc8488505aded9c70e7ee09229732d42eac4a590e11fb8f0066fb5a2d9f5b7fa95265f54d533ffc1359')

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
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS} -O3" \
		-DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
		-DWITH_CUDA=ON \
		-DTORCH_CUDA_ARCH_LIST="5.2;6.0;6.2;7.0;7.2;7.5;8.0;8.6;8.6+PTX" \
		-DCUDA_ARCH_LIST="5.2;6.0;6.2;7.0;7.2;7.5;8.0;8.6;8.6+PTX" \
		-DCMAKE_CUDA_ARCHITECTURES="52;60;60;62;70;72;75;80;86;86-virtual"
}

build() {
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "vision-$pkgver/LICENSE"
}
