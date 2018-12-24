# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=lte-cell-scanner-git
pkgver=r335.ef1ad25
pkgrel=2
pkgdesc="An OpenCL accelerated TDD/FDD LTE Scanner"
arch=('i686' 'x86_64')
url="https://github.com/JiaoXianjun/LTE-Cell-Scanner"
license=('GPL')
depends=('git')
makedepends=('cmake' 'hackrf' 'fftw' 'itpp' 'boost-libs' 'libbladerf-git')
source=("${pkgname}::git+https://github.com/JiaoXianjun/LTE-Cell-Scanner"
		"Fix-compile-issues-with-newer-libbladerf-releases.patch")
sha256sums=('SKIP'
            '5cd6c5f96b2d39a1aa0e22ea6f1d47401c0d5f26c1944ba12219d03578f7668f')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"

	patch -Np1 -i ../Fix-compile-issues-with-newer-libbladerf-releases.patch
}

build() {
	cd "$srcdir/$pkgname"

	mkdir -p "$srcdir/$pkgname/build"
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
	cd "$srcdir/$pkgname/build"

	make DESTDIR="${pkgdir}" install
}
