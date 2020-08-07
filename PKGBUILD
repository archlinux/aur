# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=torchvision-cuda
pkgdesc='datasets, transforms, and models specific to computer vision (C++ library only)'
pkgver=0.7.0
pkgrel=1
license=("BSD")
url='https://github.com/pytorch/vision'
arch=('x86_64')

provides=(torchvision)
conflicts=(torchvision)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/pytorch/vision/archive/v$pkgver.tar.gz"
)

sha512sums=('f22c8fd67f4efafa4a934ed5014e1ad661d0d0a800d4c8ae0e6b85f4860a5dc131c513428028949c9130486ba24ecf8a9f6b9881efc68a0c2158110924d05e81')

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
		-DTORCH_CUDA_ARCH_LIST="3.5;3.7;5.0;5.2;5.3;6.0;6.0+PTX;6.1;6.1+PTX;6.2;6.2+PTX;7.0;7.0+PTX;7.2;7.2+PTX;7.5;7.5+PTX" \
		-DCUDA_ARCH_LIST="3.5;3.7;5.0;5.2;5.3;6.0;6.0+PTX;6.1;6.1+PTX;6.2;6.2+PTX;7.0;7.0+PTX;7.2;7.2+PTX;7.5;7.5+PTX" \
		-DCMAKE_CUDA_ARCHITECTURES="35;37;50;52;53;60;60-virtual;61;61-virtual;62;62-virtual;70;70-virtual;72;72-virtual;75;75-virtual"

}

build() {
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "vision-$pkgver/LICENSE"
}
