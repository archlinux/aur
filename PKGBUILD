# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=lte-cell-scanner-git
pkgver=r335.ef1ad25
pkgrel=1
pkgdesc="An OpenCL accelerated TDD/FDD LTE Scanner"
arch=('i686' 'x86_64')
url="https://github.com/JiaoXianjun/LTE-Cell-Scanner"
license=('GPL')
depends=('git')
makedepends=('cmake' 'hackrf' 'fftw' 'itpp' 'boost-libs')
source=("${pkgname}::git+https://github.com/JiaoXianjun/LTE-Cell-Scanner")

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"

	mkdir -p "$srcdir/$pkgname/build"
	cd build
	cmake ../ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_VERBOSE_MAKEFILE=ON \
		-DUSE_HACKRF=1 \
		-DHACKRF_INCLUDE_DIR=/usr/include/libhackrf \
		-DUSE_OPENCL=0 # opencl wasn't working for me at the moment

	make
}

package() {
	cd "$srcdir/$pkgname/build"

	make DESTDIR="${pkgdir}" install
}
