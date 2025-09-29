# Maintainer: Vladyslav Aviedov <aur at vladaviedov dot org>
pkgname=krakenrf-kfr-git
_gitname=kfr
pkgver=r823.473dc0f
pkgrel=1
pkgdesc='Fast, modern C++ DSP framework, FFT, Sample Rate Conversion, FIR/IIR/Biquad Filters (SSE, AVX, AVX-512, ARM NEON) (for KrakenSDR)'
url='https://github.com/krakenrf/kfr'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'llvm' 'clang18' 'git' 'binutils')
provides=('krakenrf-kfr')
conflicts=('kfr' 'krakenrf-kfr')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"

	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_COMPILER=/usr/lib/llvm18/bin/clang++ \
		-DBUILD_SHARED_LIBS=ON \
		-DENABLE_CAPI_BUILD=ON \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-DKFR_ARCH=sse2 \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON

	cmake --build . -j4
}

package() {
	cd "${srcdir}/${_gitname}/build"

	make DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/lib" lib/* 
}
