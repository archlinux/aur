# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=lte-cell-scanner-git
pkgver=r24.bef6ef4
pkgrel=1
pkgdesc="An OpenCL accelerated TDD/FDD LTE Scanner"
arch=('i686' 'x86_64')
url="https://github.com/JiaoXianjun/LTE-Cell-Scanner"
license=('GPL')
depends=('git')
makedepends=('cmake' 'hackrf' 'fftw' 'itpp' 'boost' 'boost-libs' 'libbladerf-git')
source=("${pkgname}::git+https://github.com/JiaoXianjun/LTE-Cell-Scanner")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${srcdir}/${pkgname}/build"
}

build() {
	cd "${srcdir}/${pkgname}"

	cd build
	cmake ../ \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_VERBOSE_MAKEFILE=ON \
		-DUSE_HACKRF=1 \
		-DUSE_BLADERF=1 \
		-DUSE_OPENCL=0 # opencl segfaults in some cases
	make
}

package() {
	cd "${srcdir}/${pkgname}"

    cd build
	make DESTDIR="${pkgdir}" install
}
