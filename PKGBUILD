# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgbase=gemmul8
pkgname=('gemmul8-cuda' 'gemmul8-rocm')
pkgver=3.4.3
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='emulating GEMM using low-precision matrix engines, including int8 and fp8'
url="https://github.com/RIKEN-RCCS/GEMMul8"
license=('MIT')

source=(
	"${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('7643517700870c3cf1397e91551bfc0c7a8ead575d700028ad2ae173f3adaa6f')

options=(staticlibs)

build() {
	cd GEMMul8-${pkgver}
	make -j8
}

check() {
	cd GEMMul8-${pkgver}/test
	make -j8
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
