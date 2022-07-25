# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=torchvision
pkgdesc='datasets, transforms, and models specific to computer vision (C++ library only)'
pkgver=0.13.0
pkgrel=2
license=("BSD")
url='https://github.com/pytorch/vision'
arch=('x86_64')

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/pytorch/vision/archive/v$pkgver.tar.gz"
	"fix-python-linking.patch::https://github.com/pytorch/vision/commit/fb771ef5fedb76aabf00c6c6b113ae16d059ba2d.patch"
)

sha512sums=(
	'e4ca6d3764b4114e5f485acf255021e18597715b8d7a53d700537c62a84ae1bb241c3cc561b86b236675973667a57ef8ca701657cb629a2ec9c8ae4bc023950e'
	'9ce9e75f88859032ebcf2a956baf9cd1f746867b01dc16ae9d2b9d1ad5fb49be9332968c960b77acccb2161bff86e10797db45d8a670cf748b5efaaeeb3131d1'
)

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

	patch -d "$srcdir/vision-$pkgver" -p1 < "$srcdir/fix-python-linking.patch"
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
