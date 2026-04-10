#Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname=fbgemm
pkgver=1.6.0
pkgrel=2
pkgdesc="Facebook General Matrix-Matrix Multiplication (CPU-Only)"
arch=('x86_64' 'aarch64')
url="https://github.com/pytorch/FBGEMM"
license=('BSD-3-Clause')

provides=('libfbgemm' 'libcpuinfo' 'libasmjit')
depends=(
'blas'
)
makedepends=('git'
'cmake'
'gtest'
)
optdepends=(
'intel-mkl'
)
source=("${url}/archive/refs/tags/v${pkgver}.zip"
"asmjit-v1.17.tar.gz::https://github.com/asmjit/asmjit/archive/a3199e8857792cd10b7589ff5d58343d2c9008ea.tar.gz"
git+https://github.com/pytorch/cpuinfo.git
)
sha256sums=('SKIP'
'SKIP'
'SKIP'
)

prepare() {
	cd FBGEMM-${pkgver}
	rm -rf external/asmjit external/cpuinfo
	ln -sr ../asmjit-a3199e8857792cd10b7589ff5d58343d2c9008ea external/asmjit
	ln -sr ../cpuinfo external/cpuinfo
build_args=(
  -DCMAKE_INSTALL_PREFIX=/usr
  -DFBGEMM_USE_SANITIZER=address
  -DFBGEMM_LIBRARY_TYPE=shared
  -DPYTHON_EXECUTABLE=`which python3`
  -DGOOGLETEST_SOURCE_DIR=/usr/include/gtest
)
	cmake -B build ${build_args[@]} .
}

build() {
	cd FBGEMM-${pkgver}
	cmake --build build
}

check() {
	cd FBGEMM-${pkgver}
	make -C build test
}

package_fbgemm() {
	cd FBGEMM-${pkgver}
	cmake --install build --prefix ${pkgdir}/usr
	install -D build/asmjit/libasmjit.a ${pkgdir}/usr/lib/libasmjit.a
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
