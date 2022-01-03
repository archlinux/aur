# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=torchvision
pkgdesc='datasets, transforms, and models specific to computer vision (C++ library only)'
pkgver=0.11.2
pkgrel=1
license=("BSD")
url='https://github.com/pytorch/vision'
arch=('x86_64')

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/pytorch/vision/archive/v$pkgver.tar.gz"
)

sha512sums=('11891d19c1a17d27fbcc95b576a7bba7d2d2b96673661bc8488505aded9c70e7ee09229732d42eac4a590e11fb8f0066fb5a2d9f5b7fa95265f54d533ffc1359')

depends=(
	python
	python-pytorch
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
		-DWITH_CUDA=OFF
}

build() {
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "vision-$pkgver/LICENSE"
}
