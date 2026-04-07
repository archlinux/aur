# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=lte-cell-scanner-git
pkgver=r26.e7f71cb
pkgrel=2
pkgdesc="An OpenCL accelerated TDD/FDD LTE Scanner"
arch=('i686' 'x86_64')
url="https://github.com/JiaoXianjun/LTE-Cell-Scanner"
license=('GPL')
makedepends=('git' 'cmake' 'hackrf' 'fftw' 'itpp' 'boost' 'boost-libs' 'bladerf')
source=("${pkgname}::git+https://github.com/JiaoXianjun/LTE-Cell-Scanner")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	#'system' needs to be removed from this line or it won't compile
	sed -i 's/FIND_PACKAGE( Boost COMPONENTS thread system REQUIRED )/FIND_PACKAGE( Boost COMPONENTS thread REQUIRED )/' CMakeLists.txt
}

build() {
	cd "$pkgname"
	local cmake_options=(
		-B build
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_VERBOSE_MAKEFILE=ON
		-DUSE_HACKRF=1
		-DUSE_BLADERF=1
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
		-DUSE_OPENCL=0 # opencl segfaults in some cases
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
