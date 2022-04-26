# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=torchvision-cuda
pkgdesc='datasets, transforms, and models specific to computer vision (C++ library only)'
pkgver=0.12.0
pkgrel=1
license=("BSD")
url='https://github.com/pytorch/vision'
arch=('x86_64')

provides=(torchvision)
conflicts=(torchvision)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/pytorch/vision/archive/v$pkgver.tar.gz"
)

sha512sums=('ebc48a9e9ef58cc93c1b095e565c67feb2bc1bf06551e8f891a0369c211c6732e10bf191298b0633a05664371fa6dc637aab851b01a57f6b3e0d5936e87ee8ae')

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
