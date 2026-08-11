# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgbase=gemmul8
pkgname=('gemmul8-cuda' 'gemmul8-rocm')
pkgver=3.1.1
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='emulating GEMM using low-precision matrix engines, including int8 and fp8'
url="https://github.com/RIKEN-RCCS/GEMMul8"
license=('MIT')

source=(
	"${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('f8e1516ca8be76a6dcd01c297109607c3e8ce9673552dc9ab82467a9d929ac10')

build() {
	cd GEMMul8-${pkgver}
	make -j6
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
