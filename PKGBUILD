# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgbase=gemmul8
pkgname=('gemmul8-cuda' 'gemmul8-rocm')
pkgver=3.3.0
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='emulating GEMM using low-precision matrix engines, including int8 and fp8'
url="https://github.com/RIKEN-RCCS/GEMMul8"
license=('MIT')

source=(
	"${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('88c9f93f13c4766a0fd643d9001dd4b75770c2053910961fcbb3761fb7112699')

options=(staticlibs)

build() {
	cd GEMMul8-${pkgver}
	make -j6
}

check() {
	cd GEMMul8-${pkgver}/test
	make -j6
	make run MODE="accuracy_rectangle GEMM D trans=A"
}

_package() {
	cd GEMMul8-${pkgver}
        install -D lib/libgemmul8.so ${pkgdir}/usr/lib/libgemmul8.so
	install -D lib/libgemmul8.a ${pkgdir}/usr/lib/libgemmul8.a
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
	depends=('amdsmi' 'hipblaslt')
	optdepends=('hip-runtime-amd')
	provides=('gemmul8')
	conflict=('gemmul8-cuda')

	_package
}
