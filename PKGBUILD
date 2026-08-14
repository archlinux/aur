# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgbase=gemmul8
pkgname=('gemmul8-cuda' 'gemmul8-rocm')
pkgver=3.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='emulating GEMM using low-precision matrix engines, including int8 and fp8'
url="https://github.com/RIKEN-RCCS/GEMMul8"
license=('MIT')

source=(
	"${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('6ed08492866185b6868ea74e1b3fcd253dc145313449c5b29beb5a8642a97a30')

build() {
	cd GEMMul8-${pkgver}
	make -j6
}

check() {
	cd GEMMul8-${pkgver}/test
	make -j6
	make run MODE="accuracy_rectangle GEMM D transA=N transB=N"
}

_package() {
	cd GEMMul8-${pkgver}
        install -D lib/libgemmul8.so ${pkgdir}/usr/lib/libgemmul8.so

        install -Dm644 LICENSE ${pkgdir}/usr/share/${pkgbase}/LICENSE
	install -d ${pkgdir}/usr/include
	cp -r include ${pkgdir}/usr/include/${pkgbase}
}


package_gemmul8-cuda() {
	depends=('cuda')
	provides=('gemmul8')

	_package
}

package_gemmul8-rocm() {
	depends=('hip-runtime-amd')
	provides=('gemmul8')
	conflict=('gemmul8-cuda')

	_package
}
