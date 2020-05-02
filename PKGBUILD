# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=torchvision-cuda
pkgdesc='datasets, transforms, and models specific to computer vision (C++ library only)'
pkgver=0.6.0
pkgrel=2
license=("BSD")
url='https://github.com/pytorch/vision'
arch=('x86_64')

provides=(torchvision)
conflicts=(torchvision)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/pytorch/vision/archive/v$pkgver.tar.gz"
)

sha512sums=(
	'85702dae2bd9dadd0341da4dff72ed279c17120ebe3b82abaf94197f3c78958603366ea2eeb578b17f9dae456eb59a7413b92178ab6db945694b95128785addd'
)

depends=(
	python
	python-pytorch-cuda
	cuda
)

prepare() {
	rm -rf build
	mkdir build
	cd build
	cmake "../vision-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DWITH_CUDA=ON \
		-DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc
}

build() {
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "vision-$pkgver/LICENSE"
}
